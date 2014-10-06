require 'nokogiri'
require 'open-uri'


module ViennaLunch::Restaurants::Ulrich
  NAME = "Ulrich"
  ADDRESS = "St. Ulrichplatz 1, 1070 Wien"
  LOCATION = [48.2047882,16.3528004]
  URL = 'http://ulrichwien.at/'
  MENU_URL = 'http://ulrichwien.at/speisekarte/'

  WEEKDAYS = ['MONTAG', 'DIENSTAG', 'MITTWOCH', 'DONNERSTAG', 'FREITAG']

  def self.lunch
    doc = Nokogiri::HTML(open(MENU_URL))

    food = ''
    first_tab = doc.css('.tab-content').first

    # find today
    weekday_today = Date.today.wday - 1 # starting week on monday
    first_tab.css('.menu-posts').each do |post|
      weekday = post.css('.category-title h2').text
      if WEEKDAYS.index(weekday) == weekday_today
        food = post.css('.menu-title').map{ |el| el.text }.join(', ')
      end
    end

    return food
  end
end
