require 'nokogiri'
require 'open-uri'


module ViennaLunch::Restaurants::VictusUndMili
  NAME = "Victus und Mili"
  ADDRESS = "Neustiftgasse 28, 1070 Wien"
  LOCATION = [48.205461,16.351922]
  URL = 'http://victusundmili.at'
  MENU_URL = 'http://victusundmili.at'

  def self.lunch
    doc = Nokogiri::HTML(open(MENU_URL))
    doc.encoding = 'utf-8'
    menu = doc.at_css('#first_entry_message')
    food = []

    menu.children.each do |child|
      content = child.text.gsub("\n", "")

      if content.present?
        food.push(content)
      end
    end

    food.join('<br>')
  end
end
