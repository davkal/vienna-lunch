require 'json'
require 'open-uri'

module ViennaLunch::Restaurants::Figar
  NAME = "Figar"
  ADDRESS = "Kirchengasse 18, 1070 Wien"
  LOCATION = ""
  MENU_URL = 'https://www.facebook.com/feeds/page.php?id=719106121449593&format=json'
  
  def self.lunch
    doc = JSON.load(open(MENU_URL))

    return doc['entries'][0]['content']
  end
end
