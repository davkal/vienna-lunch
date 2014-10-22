require 'open-uri'
require 'pdf_helper'


module ViennaLunch::Restaurants::CoteSud
  NAME = "Coté Sud"
  ADDRESS = "Schleifmühlgasse 8, 1040 Wien"
  LOCATION = [48.1968492,16.3659149]
  URL = "http://www.cotesud.at"
  MENU_URL = 'http://www.cotesud.at/Menu.pdf'

  # mapping pdf lines to text boxes in columns in PDF
  DAY_MAPPING = {
    1 => 0,
    2 => 2,
    3 => 4,
    4 => 1,
    5 => 3
  }

  def self.lunch
    io = open(MENU_URL)
    pages = PDFTextProcessor.process(io)

    menus1 = []
    menus2 = []
    menu_lines = pages.first[:lines]
    menu_lines.each do |line|
      # look for menu lines starting with '1)...' or '2)...'
      text_box = line[:text_groups].first
      text = text_box[:text].gsub(/\s+/, ' ').strip
      if text['1)']
        menus1.push(text)
      end
      if text['2)']
        menus2.push(text)
      end
    end

    index = DAY_MAPPING[Date.today.wday]
    if index
      menu1 = menus1[index]
      menu2 = menus2[index]

      return "#{menu1}<br>#{menu2}"
    else
      return ""
    end
  end
end
