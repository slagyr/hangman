module Hangman
  module Players
    class HumanPlayer

      attr_accessor :word_list

      def initialize(ui)
        @ui = ui
      end

      def new_game(guesses_left)
      end

      def guess(word, guesses_left)
        return @ui.wait_for_guess
      end

      def incorrect_guess(guess)
      end

      def correct_guess(guess)
      end

      def fail(reason)
      end

      def game_result(result, word)
      end

      def game_score(score)
      end
    end
  end
end
