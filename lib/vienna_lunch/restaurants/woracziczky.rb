require 'json'
require 'open-uri'

module ViennaLunch::Restaurants::Woracziczky
  NAME = "Woracziczky"
  ADDRESS = "Spengergasse 52, 1050 Wien"
  LOCATION = [48.189289,16.353079]
  URL = 'http://www.woracziczky.at/'
  MENU_URL = 'https://graph.facebook.com/v2.2/350394680695/feed?'
  
  def self.lunch
    return facebook_lunch(MENU_URL, /(starten|menü|heut|mittag|montag|dienstag|mittwoch|donnerstag|freitag|wochenende)/i)
  end
end
