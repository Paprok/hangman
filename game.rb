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
    @view.show_blank(@game_data.blank)
    guessed = @view.get_guess
    resolve_guessed(guessed)
  end

  def resolve_guessed(guessed)
    guessed.size > 1 ? resolve_letter(guessed) : resolve_word(guessed)
  end

  def resolve_letter(guessed)
    # code here
  end

  def resolve_word(guessed)
    # code here
  end

  def announce_outcome(game_data)
    if game_data.lives < 1
      @view.announce_loss
    else
      @view.announce_win(game_data)
    end
  end
end