require_relative 'file_loader'
require_relative 'view'

class Game

  def initialize(lives)
    @lives = lives
    @country_and_capital = get_country_and_capital
    @blank = create_blank(@country_and_capital.capital)
    @view = View.new(@country_and_capital)
  end

  def run
    while @lives.positive?
      guess
    end
  end

  private

  def guess
    @view.show_blank(@blank)
    @lives -= 1
  end

  def get_country_and_capital
    countries_and_capitals = FileLoader.new('country_and_capital.txt').countries_and_capitals
    n = rand(countries_and_capitals.length)
    capital_and_country = countries_and_capitals[n]
    puts "cheat: #{capital_and_country}" #only for testing purposes
    capital_and_country
  end


  def create_blank(capital)
    length = capital.size
    length -= 1
    blank = ''
    (0..length).each { |i| blank << get_blank(capital, i) }
    blank
  end

  def get_blank(capital, i)
    capital[i] == ' ' ? ' ' : '_'
  end
end