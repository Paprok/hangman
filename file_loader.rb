require_relative 'country_capital'

class FileLoader

  def initialize(filename)
    @filename = filename
  end

  def countries_and_capitals
    list = []
    File.foreach(@filename) do |line|
      list << CountryCapital.new(line.split('|'))
    end
    list
  end

end
