module DefaultScene

  attr_accessor :guess

  prop_reader :new_game_menu_item, :word_area, :status, :hangman

  def scene_opened(e)
    production.game_engine.ui = self if production.game_engine
  end

  def close
    stage.close
  end

  def play_new_game
    @game_thread = Thread.new do
      begin
        require 'hangman/players/human_player'
        production.game_engine.play_games([::Hangman::Players::HumanPlayer.new(self)], 1)
      rescue StandardError => e
        puts e
        puts e.backtrace
      end
    end 
  end

  def wait_for_guess
    @guess = nil
    while(@guess == nil)
      sleep(0.25)
    end
    return @guess
  end

  #### UI Interface to HangmanEngine

  def new_game(player, guesses_per_game)
    puts "****************************"
    puts "New game with #{player.class.name}"
    @player = player
    new_game_menu_item.disable
    word_area.clear
    hangman.reset
    find_by_name("letter").each { |letter| letter.enable }
    status.text = "Select you guess below."
  end

  # the current player lost this game because of a failure.
  def fail(reason)
    status.text = "Failure: #{reason}"
  end

  def guessed(letter)
    puts "guessed letter: #{letter}"
  end

  def incorrect_guess(guess)
    hangman.miss
    status.text = "Sorry, there are no #{guess.upcase}'s."
  end

  def correct_guess(guess)
    status.text = "Yes, there are some #{guess.upcase}'s."
  end

  def update_word(word)
    word_area.update_word(word)
  end

  def game_score(score)
    puts "score: #{score}"
  end

  def game_result(result, word)
    puts "result: #{result}"
    if result == "fail" || result == "loss"
      word_area.show_loss(word)
      status.text += " The hangman is toast."
    else
      word_area.show_win
      status.text += " The hangman is saved!"
    end
    find_by_name("letter").each { |letter| letter.disable }
    new_game_menu_item.enable
  end

  def set_delay(delay)
  end

end