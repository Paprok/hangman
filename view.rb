class View

  def guess_message(game_data)
    message = 'GUESS THE CAPITAL'
    game_data.lives == game_data.hint_at ? puts("#{message} OF #{game_data.country}") : puts("#{message}!")
  end

  def show_blank(blank)
    to_show = ''
    size = blank.size - 1
    (0..size).each {|i| add_letter_and_space(blank, i, to_show)}
    puts to_show
  end

  def show_lives(lives)
    puts "#{lives} Lives left"
  end

  def get_guess
    puts('type letter or whole capital:')
    guessed = gets.chomp
    unless valid_guess(guessed)
      puts 'only letters or spaces allowed'
      get_guess
    end
    guessed.upcase
  end

  def show_wrongly_guessed(wrongly_guessed)
    guesses = ""
    wrongly_guessed.each {|guess| guesses += ", #{guess}"}
    puts("Guessed so far: #{guesses}")
  end

  def announce_loss
    puts 'You lost, better luck next time!'
  end

  def announce_win(game_data)
    puts "You won with #{game_data.lives} left!"
  end

  private

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