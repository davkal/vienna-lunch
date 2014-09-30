module ViennaLunch::Restaurants
  GLOB = "lib/vienna_lunch/restaurants/*.rb"

  def self.load_all
    return [ViennaLunch::Restaurants::Podium]


    Dir[GLOB].each do |file|
      require file
      file_name = File.basename(file, '.rb')
      file_name.camelcase.constantize.new
    end
  end
end

