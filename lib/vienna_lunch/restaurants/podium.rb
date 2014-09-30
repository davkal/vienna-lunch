require 'nokogiri'
require 'open-uri'


module ViennaLunch::Restaurants::Podium
  NAME = "Podium"
  ADDRESS = "Westbahnstrasse 33, 1070 Wien"
  LOCATION = ""
  MENU_URL = 'http://www.restaurant-podium.at/menue.html'
  
  def self.today
    doc = Nokogiri::HTML(open(MENU_URL))

    meat = doc.xpath("//table[4]//font[1]/text()")
    vegetarian = doc.xpath("//table[7]//font[1]/text()")

    "#{meat} or #{vegetarian}"
  end
end
