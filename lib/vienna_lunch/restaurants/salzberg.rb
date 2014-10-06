require 'json'
require 'open-uri'

module ViennaLunch::Restaurants::Salzberg
  NAME = "Salzberg"
  ADDRESS = "Magdalenenstrasse 17, 1060 Wien"
  LOCATION = [48.195521,16.353498]
  URL = "http://www.facebook.com/dassalzberg"
  MENU_URL = 'https://www.facebook.com/feeds/page.php?id=169366811687&format=json'
  
  def self.lunch
    return facebook_lunch(MENU_URL, "Tagesteller")
  end
end
