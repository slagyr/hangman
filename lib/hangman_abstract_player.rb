class HangmanAbstractPlayer
  attr_accessor :word_list

  def initialize
  end

  def new_game(guesses_left)
    @left = ('a'..'z').to_a
  end
  
  def name
    'george'
  end

  def guess(word, guesses_left)
    @left.shift
  end
  
  def incorrect_guess(guess)
  end
  
  def correct_guess(guess)
  end
  
  def fail(reason)
  end
  
  def game_result(result)
  end
  
  def game_score(score)
  end
end