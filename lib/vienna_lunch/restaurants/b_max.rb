require 'json'

module ViennaLunch::Restaurants::BMax
  NAME = "B-Max"
  ADDRESS = "Neustiftgasse 30, 1070 Wien"
  LOCATION = [48.20556,16.3494583]
  URL = "http://www.facebook.com/WienerGarkueche"
  MENU_URL = 'https://graph.facebook.com/v2.2/168365613220100/feed?'
  
  def self.lunch()
    return facebook_lunch(MENU_URL, /Mittagsteller/i)
  end
end
