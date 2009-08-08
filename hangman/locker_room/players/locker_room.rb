module LockerRoom

  prop_reader :player_list, :profile

  def scene_opened(e)
    load_players if production.computer_players.nil?
    player_names = production.computer_players.keys.sort
    self.players = production.computer_players.values
  end

  def close
    stage.hide
  end

  def players=(players)
    players = (players.sort { |a, b| a.average_score <=> b.average_score }).reverse
    player_list.build do
      players.each do |player|
        __install "locker_room/player_list_item.rb", :player => player
      end
    end
  end

  private #################################################

  def close_curtains
    build do
      curtains :id => "curtains" do
        curtains_text :text => "Loading Players..."
      end
    end
  end

  def open_curtains
    remove(find("curtains"))
  end

  def load_players
    close_curtains
    begin
      require 'hangman/player_profile'
      production.computer_players = Hangman::PlayerProfile.player_hash

      open_curtains
    rescue Exception => e
      puts e
      puts e.backtrace
      stage.alert("Could not load players!")
    end
  end


end