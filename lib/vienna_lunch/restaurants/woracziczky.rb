require 'nokogiri'
require 'open-uri'

module ViennaLunch::Restaurants::Woracziczky
  NAME = "Woracziczky"
  ADDRESS = "Spengergasse 52, 1050 Wien"
  LOCATION = ""
  MENU_URL = 'https://www.facebook.com/feeds/page.php?id=350394680695&format=rss20'
  
  def self.today
    doc = Nokogiri::XML(open(MENU_URL))

    return doc.xpath('//item[1]/title').text
  end
end
