require 'json'
require 'open-uri'

module ViennaLunch::Restaurants::Wirr
  NAME = "Wirr"
  ADDRESS = "Burggasse 70, 1070 Wien"
  LOCATION = [48.204404,16.347298]
  URL = 'http://wirr.at/?page_id=107'
  MENU_URL = 'https://www.facebook.com/feeds/page.php?id=104347469632226&format=json'
  
  def self.lunch
    return facebook_lunch(MENU_URL, 'II')
  end
end
