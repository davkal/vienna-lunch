require 'json'
require 'open-uri'

module ViennaLunch::Restaurants::Zweitbester
  NAME = "Zweitbester"
  ADDRESS = "Heumühlgasse 2, 1040 Wien"
  LOCATION = ""
  MENU_URL = 'https://www.facebook.com/feeds/page.php?id=245555312167202&format=json'
  
  def self.lunch
    doc = JSON.load(open(MENU_URL))

    return doc['entries'][0]['content']
  end
end
