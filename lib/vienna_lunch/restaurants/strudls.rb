require 'json'

module ViennaLunch::Restaurants::Strudls
  NAME = "Strudls"
  ADDRESS = "Siebensterngasse 58, 1070 Wien"
  LOCATION = [48.2022565,16.3474679]
  URL = "https://www.facebook.com/strudls"
  MENU_URL = 'https://graph.facebook.com/v2.2/1625265247734609/feed?'

  def self.lunch()
    return facebook_lunch(MENU_URL, /tagesteller/i)
  end
end
