require 'nokogiri'
require 'open-uri'

module ViennaLunch::Restaurants::Zweitbester
  NAME = "Zweitbester"
  ADDRESS = "Heumühlgasse 2, 1040 Wien"
  LOCATION = ""
  MENU_URL = 'https://www.facebook.com/feeds/page.php?id=245555312167202&format=rss20'
  
  def self.lunch
    doc = Nokogiri::XML(open(MENU_URL))

    return doc.xpath('//item[1]/title').text
  end
end
