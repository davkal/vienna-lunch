require 'nokogiri'
require 'open-uri'

module ViennaLunch::Restaurants::Wirr
  NAME = "Wirr"
  ADDRESS = "Burggasse 70, 1070 Wien"
  LOCATION = ""
  MENU_URL = 'https://www.facebook.com/feeds/page.php?id=104347469632226&format=rss20'
  
  def self.lunch
    doc = Nokogiri::XML(open(MENU_URL))

    return doc.xpath('//item[1]/description').text
  end
end
