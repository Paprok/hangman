class View

  def initialize(country_and_capital)
    @country_and_capital = country_and_capital
  end

  def show_blank(blank)
    puts 'GUESS THE CAPITAL!'
    to_show = ''
    size = blank.size
    size -= 1
    (0..size).each {|i| add_letter_and_space(blank, i, to_show)
    }
    puts to_show
  end

  private

  def add_letter_and_space(blank, i, to_show)
    to_show << blank[i]
    to_show << ' '
  end
end