require 'nokogiri'
require 'open-uri'


module ViennaLunch::Restaurants::Ulrich
  NAME = "Ulrich"
  ADDRESS = "St. Ulrichplatz 1, 1070 Wien"
  LOCATION = [48.2047882,16.3528004]
  URL = 'http://ulrichwien.at/'
  MENU_URL = 'http://ulrichwien.at/'

  WEEKDAYS = ['Montag', 'Dienstag', 'Mittwoch', 'Donnerstag', 'Freitag']

  def self.lunch
    doc = Nokogiri::HTML(open(MENU_URL))

    food = ''
    first_tab = doc.css('#mittagsmenu .entry-content-wrapper').first

    # find today
    weekday_today = Date.today.wday - 1 # starting week on monday
    first_tab.css('.flex_column').each do |post|
      weekday = post.css('h3').text
      if WEEKDAYS.index(weekday) == weekday_today
        food = weekday + ': ' + post.css('section p').map{ |el| el.text }.join('<br>')
      end
    end

    return food
  end
end
