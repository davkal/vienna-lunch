require 'nokogiri'
require 'open-uri'

module ViennaLunch::Restaurants::CafePierre
  NAME = "Café Pierre"
  ADDRESS = "Barnabitengasse 2, 1060 Wien"
  LOCATION = [48.19802,16.35462]
  URL = "http://www.cafepierre.at/tagesteller"
  MENU_URL = 'http://www.cafepierre.at/tagesteller'

  def self.lunch
    doc = Nokogiri::HTML(open(MENU_URL))
    menu = doc.at_css('.entry-content')
    food = []

    menu.children.each do |child|
      content = child.text.gsub("\n", "")

      if content.present?
        food.push(content)
      end
    end

    food = food.reject { |e| e == "Bon Appétit"}
    food.join("<br />")
  end
end
