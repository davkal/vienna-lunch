require 'nokogiri'
require 'open-uri'


module ViennaLunch::Restaurants::Steman
  NAME = "Steman"
  ADDRESS = "Otto-Bauer-Gasse 7, 1060 Wien"
  LOCATION = [48.195551,16.34907]
  URL = "http://www.steman.at/"
  MENU_URL = 'http://www.steman.at'

  def self.lunch
    doc = Nokogiri::HTML(open(MENU_URL))

    weekday_today = Date.today.wday - 1 # starting week on monday
    todays_menu = doc.css('#wochenkarte .tagesmenu')[weekday_today]
    if todays_menu
      menu1 = todays_menu.css('.hauptspeise').text
      menu2 = todays_menu.css('.tagesteller').text

      return "Hauptspeise: #{menu1}<br>Tagesteller: #{menu2}"
    else
      return ""
    end
  end
end
