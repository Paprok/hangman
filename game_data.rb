require_relative 'file_loader'
require 'set'

class GameData
  attr_reader :country_and_capital, :lives, :hint_at, :wrongly_guessed
  attr_accessor :is_not_won, :blank

  def initialize(lives, hint_at)
    @lives = lives
    @hint_at = hint_at
    @is_not_won = true
    @wrongly_guessed = Set[]
    @country_and_capital = get_country_and_capital
    @blank = create_blank(@country_and_capital.capital)
  end

  def is_not_finished
    @lives.positive? && @is_not_won
  end

  def add_wrongly_guessed(guessed)
    @wrongly_guessed.add(guessed)
  end

  def life_lost(number)
    @lives -= number
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
    length = capital.size - 1
    blank = ''
    (0..length).each {|i| blank << blank_char_representation(capital[i])}
    blank
  end

  def blank_char_representation(letter)
    letter == ' ' ? ' ' : '_'
  end
end
