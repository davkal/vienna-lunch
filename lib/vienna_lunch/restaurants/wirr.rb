require 'json'
require 'open-uri'

module ViennaLunch::Restaurants::Wirr
  NAME = "Wirr"
  ADDRESS = "Burggasse 70, 1070 Wien"
  LOCATION = ""
  MENU_URL = 'https://www.facebook.com/feeds/page.php?id=104347469632226&format=json'
  
  def self.lunch
    doc = JSON.load(open(MENU_URL))

    return doc['entries'][0]['content']
  end
end
