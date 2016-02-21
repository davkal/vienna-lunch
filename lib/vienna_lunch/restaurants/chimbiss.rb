require 'nokogiri'
require 'open-uri'


module ViennaLunch::Restaurants::Chimbiss
  NAME = "Chimbiss"
  ADDRESS = "Nelkengasse 1, 1060 Wien"
  LOCATION = [48.1981726,16.3500609]
  URL = 'http://www.chimbiss.at'
  MENU_URL = 'http://www.chimbiss.at'

  WEEKDAYS = ['montag', 'dienstag', 'mittwoch', 'donnerstag', 'freitag']

  def self.lunch
    doc = Nokogiri::HTML(open(MENU_URL))

    food = ''
    first_tab = doc.css('#container').first

    # find today
    weekday_today = Date.today.wday - 1 # starting week on monday
    first_tab.css('.card_item').each do |post|
      weekday = post.css('.card_item_title').text
      if WEEKDAYS.index(weekday) == weekday_today
        food = weekday + ': ' + post.css('.card_item_text span').map{ |el| el.text }.join('<br>')
      end
    end

    return food
  end
end
