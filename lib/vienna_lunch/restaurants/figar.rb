require 'json'
require 'open-uri'

module ViennaLunch::Restaurants::Figar
  NAME = "Figar"
  ADDRESS = "Kirchengasse 18, 1070 Wien"
  LOCATION = ""
  MENU_URL = 'https://www.facebook.com/feeds/page.php?id=719106121449593&format=json'
  
  def self.lunch(doc = nil)
    doc ||= JSON.load(open(MENU_URL))
    food = 'no lunch found'
    doc['entries'].each do |entry|
      if entry['content'][/(heute|kochen|gibt)/i]
        food = entry['content']
        break
      end
    end

    return food
  end
end
