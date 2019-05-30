require_relative 'file_loader'

class GameData
  attr_accessor :is_not_won, :country_and_capital, :blank, :lives, :hint_at

  def initialize(lives, hint_at)
    @lives = lives
    @hint_at = hint_at
    @is_not_won = true
    @country_and_capital = get_country_and_capital
    @blank = create_blank(@country_and_capital.capital)
  end

  def is_not_finished
    @lives.positive? && @is_not_won
  end

  private

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
    (0..length).each {|i| blank << get_blank(capital, i)}
    blank
  end

  def get_blank(capital, i)
    capital[i] == ' ' ? ' ' : '_'
  end
end
