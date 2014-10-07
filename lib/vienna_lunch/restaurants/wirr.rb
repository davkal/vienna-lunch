require 'open-uri'

module ViennaLunch::Restaurants::Wirr
  NAME = "Wirr"
  ADDRESS = "Burggasse 70, 1070 Wien"
  LOCATION = [48.204404,16.347298]
  URL = 'http://wirr.at/?page_id=107'
  MENU_URL = URL
  
  def self.lunch
    doc = Nokogiri::HTML(open(MENU_URL))

    weekday_today = Date.today.wday # skipping first <p>
    todays_menu = doc.css('.post-excerpt p')[weekday_today]
    if todays_menu
      return todays_menu.text
    else
      return ""
    end
  end
end
