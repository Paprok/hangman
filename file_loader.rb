class FileLoader
  def initialize(filename)
    @filename = filename
  end

  def countries_and_capitols
    map = []
    File.foreach(@filename) do |line|
      map << line.split('|')
    end
    return map
  end
end
