require 'json'

module ViennaLunch::Restaurants::Marks
  NAME = "Marks"
  ADDRESS = "Neustiftgasse 82, 1070 Wien"
  LOCATION = [48.2057934,16.3424748]
  URL = "https://www.facebook.com/Neustiftgasse82"
  MENU_URL = 'https://graph.facebook.com/v2.2/259397950824552/feed?'

  def self.lunch()
    return facebook_lunch(MENU_URL, /Mittagsangebote/i)
  end
end
