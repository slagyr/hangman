module Hangman
  module UIs

    class SimpleTextUI
      # initialize ui
      def initialize(verbose = true)
        @verbose = verbose
        say "*** Hangman ***"
      end

      # a new game was started. update ui

      def new_game(player, guesses_per_game)
        say "****************************"
        say "New game with #{player.class.name}"
        @player = player
        @guesses_left = guesses_per_game
        @guessed_letters = []
        @incorrect_letters = []
        @available_letters = ('a'..'z').to_a
      end

      # the current player lost this game because of a failure.

      def fail(reason)
        say "fail! reason: #{reason}"
      end

      def guessed(letter)
        @guessed_letters.push(@available_letters.delete(letter))
        say "guessed letter: #{letter}"
      end

      def incorrect_guess(guess)
        @incorrect_letters.push(guess)
        @guesses_left -= 1
        say "incorrect guess: #{guess}"
      end

      def correct_guess(guess)
        say "correct guess: #{guess}"
      end

      def update_word(word)
        @word = word
        say "word: #{word}"
      end

      def game_score(score)
        say "score: #{score}"
      end

      def game_result(result, word)
        say "result: #{result}"
      end

      def set_delay(delay)
        @delay = delay
      end

      private

      def say(stuff)
        puts stuff if @verbose
      end
    end
  end
end
