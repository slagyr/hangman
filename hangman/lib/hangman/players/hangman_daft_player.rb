module Hangman
  module Players
    class HangmanDaftPlayer
      attr_accessor :word_list

      def initialize
      end

      def new_game(guesses_left)
        @left = ('a'..'z').to_a
      end

      def name
        'daft player'
      end

      def guess(word, guesses_left)
        g = @left[rand(@left.size)]
        @left.delete(g)
        g
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
