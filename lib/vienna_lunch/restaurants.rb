module ViennaLunch::Restaurants
  GLOB = "lib/vienna_lunch/restaurants/*.rb"
  LIST = [
    ViennaLunch::Restaurants::Figar,
    ViennaLunch::Restaurants::Podium,
    ViennaLunch::Restaurants::Salzberg,
    ViennaLunch::Restaurants::Steman,
    ViennaLunch::Restaurants::Ulrich,
    ViennaLunch::Restaurants::Wirr,
    ViennaLunch::Restaurants::Woracziczky,
    ViennaLunch::Restaurants::Zweitbester
  ]

  def self.load_all
    # FIXME replace LIST by loading modules from restaurants in GLOB dir
    #Dir[GLOB].each do |file|
    #  require file
    #  file_name = File.basename(file, '.rb')
    #  file_name.camelcase.constantize.new
    #end

    return LIST.map do |restaurant|
      {
        name: restaurant::NAME,
        address: restaurant::ADDRESS,
        location: restaurant::LOCATION,
        lunch: restaurant::lunch,
      }
    end
  end
end

