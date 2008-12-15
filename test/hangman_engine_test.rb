require "test/unit"

require "hangman_engine"
require "hangman_abstract_ui"
require "hangman_abstract_player"
require "uis/text_ui"
# Dir['players/*.rb'].each{|player|
#   require player
# }

class TestHangmanEngine < Test::Unit::TestCase
  def setup
    @ui = TextUI.new
    @player = HangmanAbstractPlayer.new
    @engine = HangmanEngine.new(@ui)
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