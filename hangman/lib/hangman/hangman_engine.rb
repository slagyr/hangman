module Hangman
  class HangmanEngine
    DICTIONARY = File.dirname(__FILE__) + "/words"
    attr_accessor :ui, :rounds

    def initialize(ui, options = {})
      @rounds = options[:rounds] || 1
      @ui = ui
      load_word_list
    end

    def play_games(players, count, ui_delay = 0.0)
      @ui.set_delay(ui_delay)
      @chosen_words = Array.new(count).map{ rand_word }
      stats = {}
      players.each do |player|
        @player_stats = stats[player] = {:wins => 0, :losses => 0, :fails => 0, :score => 0, :time => 0.0}
        time { player.word_list = @words }
        @chosen_words.each do |round_word|
          result, score = play_game(player, round_word)
          stats[player][pluralize[result].to_sym] += 1
          stats[player][:score] += score
        end
      end
      stats
    end

    def play_game(player, word)
      begin
        @player = player
        @word = word
        new_game
        @ui.update_word(filtered_word)
        until over? do
          player_guess = time { player.guess(filtered_word, @guesses_left) }
          guess( player_guess)
        end
        return game_result(word), score
      rescue Exception => e
        fail!("Player raised exception: #{e.class.name}: #{e.message}")
        puts e
        puts e.backtrace
        return game_result(word), score
      end
    end

    protected

    def new_game
      @guesses_left = 6
      @ui.new_game(@player, @guesses_left)
      time { @player.new_game(@guesses_left) }
      @fail = nil
      @guessed_letters = []
      @available_letters = ('a'..'z').to_a
    end

    def rand_word
      @words[rand(@words.size)]
    end

    def guess(player_guess)
      player_guess = player_guess.downcase if player_guess
      @ui.guessed(player_guess)
      unless @available_letters.include?(player_guess)
        fail!('Invalid guess')
      else
        if @word.include?(player_guess)
          #correct
          time{ @player.correct_guess(player_guess) }
          @ui.correct_guess(player_guess)
        else
          #incorrect
          @guesses_left -= 1
          time { @player.incorrect_guess(player_guess) }
          @ui.incorrect_guess(player_guess)
        end
        @guessed_letters.push(@available_letters.delete(player_guess))
        @ui.update_word(filtered_word)
      end
    end

    def over?
      dead? || won?
    end

    def dead?
      @guesses_left == 0 || @fail
    end

    def won?
      !dead? && filtered_word == @word
    end

    # often => _f_en

    def filtered_word
      @word.split('').map{|i| @guessed_letters.include?(i) || (i !~ /[a-z]/) ? i : '_' }.join('')
    end

    def fail!(reason)
      @fail = reason
      time { @player.fail(reason) }
      @ui.fail(reason)
    end

    def load_word_list
      @words = File.read(DICTIONARY).downcase.split("\n").sort.uniq
      @words.freeze
    end

    def game_result(word)
      result =
              if won?
                'win'
              elsif @fail
                'fail'
              else
                'loss'
              end
      @ui.game_result(result, word)
      time { @player.game_result(result, word) }
      result
    end

    def score
      score = @guesses_left * 10
      score -= unguessed_spaces * 5
      score = -100 if @fail
      @ui.game_score(score)
      time { @player.game_score(score) }
      score
    end

    def unguessed_spaces
      filtered_word.gsub(/[^_]/, '').size
    end

    # little hack because I miss rails

    def pluralize
      {'win' => 'wins', 'loss' => 'losses', 'fail' => 'fails'}
    end


    def time
      before = Time.now
      value = yield
      after = Time.now
      @player_stats[:time] += (after - before)
      return value
    end
  end
end