require_relative 'file_loader'
require_relative 'view'

class Game

  def initialize(lives)
    @lives = lives
    @country_and_capital = get_country_and_capital
    @guessed_capital = create_blank
    @view = View.new(@country_and_capital)
  end

  def run
    while @lives > 0
      @view.show_word
      @lives -= 1;
    end
  end

  private

  def get_country_and_capital
    coutries_and_capitols = FileLoader.new('country_and_capital.txt').countries_and_capitols
    n = rand(coutries_and_capitols.length)
    capital_and_country = coutries_and_capitols[n]
  end

  def create_blank
    length = @country_and_capital[1].size
    blank = ''
    for i in 1..length
      blank << '_'
    end
    return blank
  end

end