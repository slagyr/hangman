class HangmanAbstractUI
  # initialize ui
  def initialize
  end

  # a new game was started. update ui
  def new_game(player, guesses_per_game)
    @player = player
    @guesses_left = guesses_per_game
    @guessed_letters = []
    @incorrect_letters = []
    @available_letters = ('a'..'z').to_a
  end

  # the current player lost this game because of a failure.
  def fail(reason)
  end
  
  def guessed(letter)
    @guessed_letters.push(@available_letters.delete(letter))
  end

  def incorrect_guess(guess)
    @incorrect_letters.push(guess)
    @guesses_left -= 1
  end
  
  def correct_guess(guess)
  end
  
  def update_word(word)
    @word = word
  end
  
  def game_score(score)
  end
  
  def game_result(result)
  end
  
  def set_delay(delay)
    @delay = delay
  end
end
