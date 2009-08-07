class HumanPlayer

  def initialize(ui)
    @ui = ui
puts "HumanPlayer.init #{ui}"
  end

  def new_game(guesses_left)
puts "HumanPLayer.new_game"
  end

  def name
    'Human player'
  end

  def guess(word, guesses_left)
puts "HumanPlayer.guess"
    return @ui.wait_for_guess
  end

  def incorrect_guess(guess)
puts "HumanPlayer.incorrect_guess"
  end

  def correct_guess(guess)
puts "HumanPlayer.correct_guess"
  end

  def fail(reason)
puts "HumanPlayer.fail #{reason}"
  end

  def game_result(result, word)
puts "HumanPlayer.game_result #{result}"
  end

  def game_score(score)
puts "HumanPlayer.game_score #{score}"
  end
end