require 'json'
require 'open-uri'

module ViennaLunch::Restaurants::Woracziczky
  NAME = "Woracziczky"
  ADDRESS = "Spengergasse 52, 1050 Wien"
  LOCATION = [48.189289,16.353079]
  URL = 'http://www.woracziczky.at/'
  MENU_URL = 'https://www.facebook.com/feeds/page.php?id=350394680695&format=json'
  
  def self.lunch
    return facebook_lunch(MENU_URL, /(menü|heut|mittag)/i)
  end
end
