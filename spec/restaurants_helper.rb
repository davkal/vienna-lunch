def resource(file_name)
  @fh = open(File.join('spec/restaurants/support', file_name))
  if file_name['.json']
    JSON.load(@fh)
  else
    @fh.read
  end
end
