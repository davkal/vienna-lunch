require 'json'

module ViennaLunch::Restaurants::MaranVegan
  NAME = "Maran Vegan"
  ADDRESS = "Stumpergasse 57, 1060 Wien"
  LOCATION = [48.1954,16.34273]
  URL = "https://www.facebook.com/maranvegan"
  MENU_URL = 'https://graph.facebook.com/v2.2/117745871753480/feed?'

  def self.lunch()
    return facebook_lunch(MENU_URL, /(montag,|dienstag,|mittwoch,|donnerstag,|freitag,)/i)
  end
end
