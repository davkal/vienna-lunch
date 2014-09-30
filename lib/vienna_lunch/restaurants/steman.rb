require 'nokogiri'
require 'open-uri'


module ViennaLunch::Restaurants::Steman
  NAME = "Steman"
  ADDRESS = "Otto-Bauer-Gasse 7, 1060 Wien"
  LOCATION = ""
  MENU_URL = 'http://www.steman.at'

  def self.today
    doc = Nokogiri::HTML(open(MENU_URL))

    weekday_today = Date.today.wday - 1 # starting week on monday
    todays_menu = doc.css('#wochenkarte .tagesmenu')[weekday_today]
    menu1 = todays_menu.css('.hauptspeise').text
    menu2 = todays_menu.css('.tagesteller').text

    "I. #{menu1}, II. #{menu2}"
  end
end
