require 'json'

module ViennaLunch::Restaurants::Reisingers
  NAME = "Reisinger's"
  ADDRESS = "Salzgries 15, 1010 Wien"
  LOCATION = [48.2131915,16.3712242]
  URL = "http://www.facebook.com/reisingers"
  MENU_URL = 'https://graph.facebook.com/v2.2/66475432531/feed?'
  
  def self.lunch()
    return facebook_lunch(MENU_URL, /(montag|dienstag|mittwoch|donnerstag|freitag)/i)
  end
end
