require 'json'

module ViennaLunch::Restaurants::Figar
  NAME = "Figar"
  ADDRESS = "Kirchengasse 18, 1070 Wien"
  LOCATION = [48.201028,16.352314]
  URL = "http://www.facebook.com/zum.figar"
  MENU_URL = 'https://www.facebook.com/feeds/page.php?id=719106121449593&format=json'
  
  def self.lunch()
    return facebook_lunch(MENU_URL, /(heut|kochen|gibt|montag|dienstag|mittwoch|donnerstag|freitag|today)/i)
  end
end
