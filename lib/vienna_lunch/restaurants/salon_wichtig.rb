require 'json'

module ViennaLunch::Restaurants::SalonWichtig
  NAME = "Salon Wichtig"
  ADDRESS = "Karlsgasse 22, 1040 Wien"
  LOCATION = [48.1967494,16.3673281]
  URL = "http://www.facebook.com/salonwichtig"
  MENU_URL = 'https://graph.facebook.com/v2.2/157130814318556/feed?'
  
  def self.lunch()
    return facebook_lunch(MENU_URL, /(heut|today|mmm)/i)
  end
end
