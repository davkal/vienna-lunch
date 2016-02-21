require 'json'

module ViennaLunch::Restaurants::HaseUndIgel
  NAME = "Hase und Igel"
  ADDRESS = "Theobaldgasse 16, 1060 Wien"
  LOCATION = [48.2002891,16.3573646]
  URL = "https://www.facebook.com/diefeinkost"
  MENU_URL = 'https://graph.facebook.com/v2.2/417198735075269/feed?'

  def self.lunch()
    return facebook_lunch(MENU_URL, /heute/i)
  end
end
