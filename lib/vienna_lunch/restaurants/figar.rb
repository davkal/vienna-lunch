require 'nokogiri'
require 'open-uri'

module ViennaLunch::Restaurants::Figar
  NAME = "Figar"
  ADDRESS = "Kirchengasse 18, 1070 Wien"
  LOCATION = ""
  MENU_URL = 'https://www.facebook.com/feeds/page.php?id=719106121449593&format=rss20'
  
  def self.lunch
    doc = Nokogiri::XML(open(MENU_URL))

    return doc.xpath('//item[1]/title').text
  end
end
