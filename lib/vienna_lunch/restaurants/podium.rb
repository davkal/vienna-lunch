require 'nokogiri'
require 'open-uri'


module ViennaLunch::Restaurants::Podium
  NAME = "Podium"
  ADDRESS = "Westbahnstrasse 33, 1070 Wien"
  LOCATION = ""
  MENU_URL = 'http://www.restaurant-podium.at/menue.html'
  
  def self.lunch
    doc = Nokogiri::HTML(open(MENU_URL))

    menu1 = doc.xpath("//table[4]//font[1]/text()")
    menu2 = doc.xpath("//table[7]//font[1]/text()")

    "I. #{menu1}, II. #{menu2}"
  end
end
