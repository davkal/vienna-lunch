require 'open-uri'

module ViennaLunch::Restaurants::Wirr
  NAME = "Wirr"
  ADDRESS = "Burggasse 70, 1070 Wien"
  LOCATION = [48.204404,16.347298]
  URL = 'http://wirr.at/?page_id=107'
  MENU_URL = URL
  
  def self.lunch
    doc = Nokogiri::HTML(open(MENU_URL))

    # first two 2 p are empty
    # p[2-5] are monday
    # p[6-9] are tuesday
    # p[10-13] are wednesday
    # ...
    #
    # hence if weekday is n then we can get


    weekday_today = Date.today.wday - 1  # monday should be 0
    span = 4 # starter, veg, meat, dessert
    offset = weekday_today * span + 1
    paragraphs = doc.css('.post-excerpt p')
    todays_menu = ""
    todays_menu << paragraphs[offset]
    todays_menu <<  "\n"
    todays_menu << paragraphs[offset + 1]
    todays_menu <<  "\n"
    todays_menu << paragraphs[offset + 2]
    todays_menu <<  "\n"
    todays_menu << paragraphs[offset + 3]
    if todays_menu
      return todays_menu.to_s
    else
      return ""
    end
  end
end
