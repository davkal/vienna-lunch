require 'open-uri'

module ViennaLunch::Restaurants
  GLOB = "lib/vienna_lunch/restaurants/*.rb"
  LIST = [
    ViennaLunch::Restaurants::BMax,
    ViennaLunch::Restaurants::Chimbiss,
    # ViennaLunch::Restaurants::CoteSud,
    ViennaLunch::Restaurants::Figar,
    ViennaLunch::Restaurants::HaseUndIgel,
    ViennaLunch::Restaurants::MaranVegan,
    ViennaLunch::Restaurants::Marks,
    ViennaLunch::Restaurants::Podium,
    ViennaLunch::Restaurants::Reisingers,
    ViennaLunch::Restaurants::SalonWichtig,
    # ViennaLunch::Restaurants::Salzberg,
    ViennaLunch::Restaurants::Steman,
    ViennaLunch::Restaurants::Ulrich,
    ViennaLunch::Restaurants::VictusUndMili,
    ViennaLunch::Restaurants::Wirr,
    ViennaLunch::Restaurants::Woracziczky,
    ViennaLunch::Restaurants::Zweitbester,
  ]

  def self.load_all
    # FIXME replace LIST by loading modules from restaurants in GLOB dir
    #Dir[GLOB].each do |file|
    #  require file
    #  file_name = File.basename(file, '.rb')
    #  file_name.camelcase.constantize.new
    #end

    return LIST.map do |restaurant|
      begin
        lunch = restaurant::lunch
      rescue
        lunch = "(error finding lunch)"
      end

      {
        name: restaurant::NAME,
        address: restaurant::ADDRESS,
        location: restaurant::LOCATION,
        url: restaurant::URL,
        lunch: lunch,
      }
    end
  end
end

def facebook_feed(url)
  # append FB access token
  app_id = ENV["FB_APP_ID"]
  client_secret = ENV["FB_CLIENT_SECRET"]
  url = "#{url}access_token=#{app_id}%7C#{client_secret}"

  hash = JSON.load(open(url))
end

# look for lunch in FB feed entries
def facebook_lunch(url, words = nil)
  food = ''
  today = Date.today.to_s
  hash = facebook_feed(url)

  hash['data'].each do |entry|
    if entry['updated_time'][today] # only interested in today's entries
      if words && entry['message'] && entry['message'][words]
        food = entry['message']
        if entry['picture']
          puts entry
          pic_src = entry['picture']
          link_url = entry['link']
          food = "#{food}<br><a href=\"#{link_url}\" target=\"_blank\"><img src=\"#{pic_src}\"></a>"
        end
        break
      end
    end
  end

  # prefix links
  food.gsub!('href="', "target=\"#{url}\" href=\"#{hash['link']}")

  return food
end
