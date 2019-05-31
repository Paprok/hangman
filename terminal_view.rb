##
# Class serves as terminal implementation of view, gets input and
# prints status messages to terminal
class TerminalView

  ##
  # shows message with/without hint based on +game_data+
  def guess_message(game_data)
    message = 'GUESS THE CAPITAL'
    game_data.lives == game_data.hint_at ? puts("#{message} OF #{game_data.country}") : puts("#{message}!")
  end

  ##
  # shows in terminal current state of +blank+ (word to be guess)
  def show_blank(blank)
    to_show = ''
    size = blank.size - 1
    (0..size).each {|i| add_letter_and_space(blank, i, to_show)}
    puts to_show
  end

  ##
  # shows +lives+ left in terminal
  def show_lives(lives)
    puts "#{lives} Lives left"
  end

  ##
  # gets input from user untill consist of only letters and/or spaces
  def get_guess
    puts('type letter or whole capital:')
    guessed = gets.chomp
    unless valid_guess(guessed)
      puts 'only letters or spaces allowed'
      get_guess
    end
    guessed.upcase
  end

  ##
  # shows +wrongly_guessed+ - letters/words previously wrongly guessed
  # in comma separated format
  def show_wrongly_guessed(wrongly_guessed)
    guesses = ''
    wrongly_guessed.each {|guess| guesses += "#{guess}, "}
    guesses = validate_guesses(guesses)
    puts("Guessed so far: #{guesses}")
  end

  ##
  # shows loss message in terminal
  def announce_loss
    puts 'You lost, better luck next time!'
  end

  ##
  # shows win message in terminal
  def announce_win(game_data)
    puts "You won with #{game_data.lives} left!"
  end

  private

  def validate_guesses(guesses)
    guesses = guesses.strip
    if guesses.size > 1
      guesses = guesses[0...-1]
    end
    guesses
  end

  def add_letter_and_space(blank, i, to_show)
    to_show << blank[i]
    to_show << ' '
  end

  def valid_guess(guessed)
    is_valid = true
    size = guessed.size
    i = 0
    while i < size && is_valid
      unless letter?(guessed[i])
        is_valid = false
      end
      i += 1
    end
    is_valid
  end

  def letter?(char)
    char =~ /[A-Za-z ]/
  end
end