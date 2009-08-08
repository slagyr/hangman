require "test/unit"

$: << File.dirname(__FILE__) + "/../lib"
require "hangman/hangman_engine"
require "hangman/uis/simple_text_ui"
require "hangman/players/hangman_daft_player"

class TestHangmanEngine < Test::Unit::TestCase
  def setup
    @ui = Hangman::UIs::SimpleTextUI.new(false)
    @player = Hangman::Players::HangmanDaftPlayer.new
    @engine = Hangman::HangmanEngine.new(@ui)
  end

  def test_play_one_hundred_games
    stats = @engine.play_games([@player], 100, 0)
    p stats
  end
  
  def test_play_one_game
    stats = @engine.play_games([@player], 1, 0.3)
    p stats
  end
end