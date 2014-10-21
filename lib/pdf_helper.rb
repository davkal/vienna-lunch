require 'pdf-reader'
 
class CustomPageLayout < PDF::Reader::PageLayout
  attr_reader :runs
 
  # we need to filter duplicate characters which seem to be caused by shadowing
  def group_chars_into_runs(chars)
    # filter out duplicate chars before going on with regular logic,
    # seems to happen with shadowed text
    chars.uniq! {|val| {x: val.x, y: val.y, text: val.text}}
    super
  end
end
 
class PageTextReceiverKeepSpaces < PDF::Reader::PageTextReceiver
  # We must expose the characters and mediabox attributes to instantiate PageLayout
  attr_reader :characters, :mediabox
 
  private
  def internal_show_text(string)
    if @state.current_font.nil?
      raise PDF::Reader::MalformedPDFError, "current font is invalid"
    end
    glyphs = @state.current_font.unpack(string)
    glyphs.each_with_index do |glyph_code, index|
      # paint the current glyph
      newx, newy = @state.trm_transform(0,0)
      utf8_chars = @state.current_font.to_utf8(glyph_code)
 
      # apply to glyph displacment for the current glyph so the next
      # glyph will appear in the correct position
      glyph_width = @state.current_font.glyph_width(glyph_code) / 1000.0
      th = 1
      scaled_glyph_width = glyph_width * @state.font_size * th
 
      # modification to the original pdf-reader code which otherwise accidentally removes spaces in some cases
      # unless utf8_chars == SPACE
      @characters << PDF::Reader::TextRun.new(newx, newy, scaled_glyph_width, @state.font_size, utf8_chars)
      # end
 
      @state.process_glyph_displacement(glyph_width, 0, utf8_chars == SPACE)
    end
  end
end
 
class PDFTextProcessor
  MAX_KERNING_DISTANCE = 10 # experimental value
 
  # pages may specify which pages to actually parse (zero based)
  #   [0, 3] will process only the first and fourth page if present
  def self.process(pdf_io, pages = nil)
    pdf_io.rewind
    reader = PDF::Reader.new(pdf_io)
    fail 'Could not find any pages in the given document' if reader.pages.empty?
    processed_pages = []
    text_receiver = PageTextReceiverKeepSpaces.new
    requested_pages = pages ? reader.pages.values_at(*pages) : reader.pages
    requested_pages.each do |page|
      unless page.nil?
        page.walk(text_receiver)
        runs = CustomPageLayout.new(text_receiver.characters, text_receiver.mediabox).runs
 
        # sort text runs from top left to bottom right
        # read as: if both runs are on the same line first take the leftmost, else the uppermost - (0,0) is bottom left
        runs.sort! {|r1, r2| r2.y == r1.y ? r1.x <=> r2.x : r2.y <=> r1.y}
 
        # group runs by lines and merge those that are close to each other
        lines_hash = {}
        runs.each do |run|
          lines_hash[run.y] ||= []
          # runs that are very close to each other are considered to belong to the same text "block"
          if lines_hash[run.y].empty? || (lines_hash[run.y].last.last.endx + MAX_KERNING_DISTANCE < run.x)
            lines_hash[run.y] << [run]
          else
            lines_hash[run.y].last << run
          end
        end
        lines = []
        lines_hash.each do |y, run_groups|
          lines << {y: y, text_groups: []}
          run_groups.each do |run_group|
            group_text = run_group.map { |run| run.text }.join('').strip
            lines.last[:text_groups] << ({
              x: run_group.first.x,
              width: run_group.last.endx - run_group.first.x,
              text: group_text,
            }) unless group_text.empty?
          end
        end
        # consistent indexing with pages param and reader.pages selection
        processed_pages << {page: page.number, lines: lines}
      end
    end
    processed_pages
  end
end

