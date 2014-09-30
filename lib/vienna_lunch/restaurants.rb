module ViennaLunch::Restaurants
  GLOB = "lib/vienna_lunch/restaurants/*.rb"
  LIST = [
    ViennaLunch::Restaurants::Podium
  ]

  def self.load_all
    #Dir[GLOB].each do |file|
    #  require file
    #  file_name = File.basename(file, '.rb')
    #  file_name.camelcase.constantize.new
    #end

    return LIST.map do |restaurant|
      {
        name: restaurant::NAME,
        location: restaurant::LOCATION,
        today: restaurant::today,
      }
    end
  end
end

