require 'json'
require 'open-uri'

module ViennaLunch::Restaurants::Zweitbester
  NAME = "Zweitbester"
  ADDRESS = "Heumühlgasse 2, 1040 Wien"
  LOCATION = [48.195374,16.363001]
  URL = 'http://www.zweitbester.at/'
  MENU_URL = 'https://www.facebook.com/feeds/page.php?id=245555312167202&format=json'
  
  def self.lunch
    return facebook_lunch(MENU_URL, /TAGESKARTE/i)
  end
end
