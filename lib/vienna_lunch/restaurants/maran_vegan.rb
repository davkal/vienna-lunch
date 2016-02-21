require 'json'

module ViennaLunch::Restaurants::MaranVegan
  NAME = "Maran Vegan"
  ADDRESS = "Stumpergasse 57, 1060 Wien"
  LOCATION = [48.1954,16.34273]
  URL = "https://www.facebook.com/maranvegan"
  MENU_URL = 'https://graph.facebook.com/v2.3/117745871753480/feed?'

  def self.lunch()
    food = ''
    today = Date.today.day
    hash = facebook_feed(MENU_URL)

    hash['data'].each do |entry|
      if entry['message'] && entry['message'][/(Menüplan)/i]
        days = entry['message'].split("\n\n")
        days.each do |day|
          if day.include? "#{today}."
            food = day
            break
          end
        end
      end
    end
    food
  end
end