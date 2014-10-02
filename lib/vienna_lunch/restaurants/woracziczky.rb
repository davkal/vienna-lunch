require 'json'
require 'open-uri'

module ViennaLunch::Restaurants::Woracziczky
  NAME = "Woracziczky"
  ADDRESS = "Spengergasse 52, 1050 Wien"
  LOCATION = ""
  MENU_URL = 'https://www.facebook.com/feeds/page.php?id=350394680695&format=json'
  
  def self.lunch
    doc = JSON.load(open(MENU_URL))

    return doc['entries'][0]['content']
  end
end
