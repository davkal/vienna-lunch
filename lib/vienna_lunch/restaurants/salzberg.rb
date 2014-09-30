require 'nokogiri'
require 'open-uri'

module ViennaLunch::Restaurants::Salzberg
  NAME = "Salzberg"
  ADDRESS = "Magdalenenstrasse 17, 1060 Wien"
  LOCATION = ""
  MENU_URL = 'https://www.facebook.com/feeds/page.php?id=169366811687&format=rss20'
  
  def self.lunch
    doc = Nokogiri::XML(open(MENU_URL))

    return doc.xpath('//item[1]/title').text
  end
end
