title
menu do
  menu_item :id => "new_game_menu_item", :text => "New Game", :action => "scene.play_new_game"
  menu_item :id => "ais_button", :text => "Computer AIs", :action => "scene.load_computers"
  menu_item :text => "Close", :action => "scene.close"
end
hangman :id => "hangman" do
  word_area :id => "word_area" do
  end
end
status :id => "status"
letters do
  ("A".."M").each do |l|
    letter :text => l, :id => "letter_#{l}"
  end
end
letters do
  ("N".."Z").each do |l|
    letter :text => l, :id => "letter_#{l}"
  end
end
footer do
  limelight_logo
  copyright :text => "Copyright 2009 8th Light, Inc. All rights reserved."
end