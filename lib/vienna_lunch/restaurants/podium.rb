require 'nokogiri'
require 'open-uri'


module ViennaLunch::Restaurants::Podium
  NAME = "Podium"
  ADDRESS = "Westbahnstrasse 33, 1070 Wien"
  LOCATION = [48.201762,16.341378]
  URL = 'http://www.restaurant-podium.at/'
  MENU_URL = 'http://www.restaurant-podium.at/menue.html'
  
  def self.lunch
    doc = Nokogiri::HTML(open(MENU_URL))
    doc.encoding = 'utf-8'

    menu = nil
    food = []
    doc.xpath(".//table").each do |table|
      text = table.xpath('.//font[1]/text()').to_s
      if !menu.nil?
        food.push(menu)
        food.push(text)
        menu = nil
      elsif text[/(fleisch|vegetarisch)/]
        menu = text
      end
    end

    return food.join('<br>')
  end
end
