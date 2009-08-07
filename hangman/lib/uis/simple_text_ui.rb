class SimpleTextUI < HangmanAbstractUI
  # initialize ui
  def initialize
    puts "*** Hangman ***"
  end

  # a new game was started. update ui
  def new_game(player, guesses_per_game)
    puts "****************************"
    puts "New game with #{player.name}"
    @player = player
    @guesses_left = guesses_per_game
    @guessed_letters = []
    @incorrect_letters = []
    @available_letters = ('a'..'z').to_a
  end

  # the current player lost this game because of a failure.
  def fail(reason)
    puts "fail! reason: #{reason}"
  end
  
  def guessed(letter)
    @guessed_letters.push(@available_letters.delete(letter))
    puts "guessed letter: #{letter}"
  end

  def incorrect_guess(guess)
    @incorrect_letters.push(guess)
    @guesses_left -= 1
    puts "incorrect guess: #{guess}"
  end
  
  def correct_guess(guess)
    puts "correct guess: #{guess}"
  end
  
  def update_word(word)
    @word = word
    puts "word: #{word}"
  end
  
  def game_score(score)
    puts "score: #{score}"
  end
  
  def game_result(result)
    puts "result: #{result}"
  end
  
  def set_delay(delay)
    @delay = delay
  end
end