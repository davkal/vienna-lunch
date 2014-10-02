require 'json'
require 'open-uri'

module ViennaLunch::Restaurants::Salzberg
  NAME = "Salzberg"
  ADDRESS = "Magdalenenstrasse 17, 1060 Wien"
  LOCATION = ""
  MENU_URL = 'https://www.facebook.com/feeds/page.php?id=169366811687&format=json'
  
  def self.lunch
    doc = JSON.load(open(MENU_URL))

    return doc['entries'][0]['content']
  end
end
