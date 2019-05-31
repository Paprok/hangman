require_relative 'terminal_view'
require_relative 'game_data'

class Game

  def initialize(view, game_data)
    @view = view
    @game_data = game_data
  end

  def run
    while @game_data.is_not_finished
      guess
    end
    announce_outcome(@game_data)
  end

  private

  def guess
    @view.guess_message(@game_data)
    @view.show_lives(@game_data.lives)
    @view.show_blank(@game_data.blank)
    @view.show_wrongly_guessed(@game_data.wrongly_guessed)
    guessed = @view.get_guess
    resolve_guessed(guessed)
  end

  def resolve_guessed(guessed)
    if @game_data.country_and_capital.capital.include? guessed
      guessed.size > 1 ? resolve_word(guessed) : resolve_letter(guessed)
      set_game_data_if_won
    else
      guessed.size > 1 ? @game_data.life_lost(2) : @game_data.life_lost(1)
      @game_data.add_wrongly_guessed(guessed)
    end
  end

  def resolve_letter(guessed)
    capital = @game_data.country_and_capital.capital
    @game_data.blank = @game_data.blank.chars.map.with_index do |c, i|
      if capital[i] == guessed
        guessed
      else
        c
      end
    end.join
  end

  def resolve_word(guessed)
    size = guessed.size - 1
    index = @game_data.country_and_capital.capital.index guessed
    reach = index + size
    @game_data.blank[index..reach] = guessed

  end

  def announce_outcome(game_data)
    if game_data.lives < 1
      @view.announce_loss
    else
      @view.announce_win(game_data)
    end
  end
end