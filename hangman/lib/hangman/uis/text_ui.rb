require 'rubygems'
require 'ansi' # ssoroka-ansi on github
module Hangman
  module UIs

    class TextUI
      def initialize
        @dialog = []
        out 'ui initialized'
      end

      def new_game(player, guesses_per_game)
        @player = player
        @guesses_left = guesses_per_game
        @guessed_letters = []
        @incorrect_letters = []
        @available_letters = ('a'..'z').to_a
        out "Player #{player.class.name} has started a new game"
        draw_page
      end

      def fail(reason)
        out "Player #{@player.class.name} has been disqualified because: #{reason}"
        draw_page
      end

      def guessed(letter)
        out "Player #{@player.class.name} guessed #{letter}"
        @guessed_letters.push(@available_letters.delete(letter))
        draw_page
      end

      def incorrect_guess(guess)
        out "The guess was incorrect"
        @incorrect_letters.push(guess)
        @guesses_left -= 1
        draw_page
      end

      def correct_guess(guess)
        out "the guess was correct!"
        draw_page
      end

      def update_word(word)
        @word = word
        draw_page
      end

      def set_delay(delay)
        @delay = delay
      end

      def game_score(score)
        out "Game score: #{score}"
        draw_page
      end

      def game_result(result)
        out "Game result: #{result}"
        draw_page
      end

      protected

      def out(s = '')
        @dialog.push s
        @dialog.shift if @dialog.size > 8
      end

      def draw_stickman
        STDOUT.puts <<-TEXT
    O
  --|--
    |
   / \\
        TEXT
      end

      def draw_status
        STDOUT.puts "  Word:   #{@word}\n\n"
        STDOUT.puts "  Letters available: " + @available_letters.join(' ')
        STDOUT.puts "  Incorrect guesses: " + @incorrect_letters.join(' ')
        STDOUT.puts "  Guesses left:      #{@guesses_left}\n\n"
        STDOUT.puts @dialog.join("\n")
      end

      def draw_page
        STDOUT.print ANSI.clear_screen + ANSI.up(50) + ANSI.left(100)
        draw_stickman
        draw_status
        STDOUT.flush
        sleep @delay
      end
    end
  end
end
