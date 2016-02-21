require 'json'

module ViennaLunch::Restaurants::Figar
  NAME = "Figar"
  ADDRESS = "Kirchengasse 18, 1070 Wien"
  LOCATION = [48.201028,16.352314]
  URL = "http://www.facebook.com/zum.figar"
  MENU_URL = 'https://graph.facebook.com/v2.2/719106121449593/feed?'
  
  def self.lunch()
    return facebook_lunch(MENU_URL, /(heut|kochen|gibt|montag|dienstag|mittwoch|donnerstag|freitag|today|monday|tuesday|wednesday|thursday|friday)/i)
  end
end
