title
menu do
  menu_item :text => "Close", :action => "scene.close"
  menu_item :id => "new_game_menu_item", :text => "New Game", :action => "scene.play_new_game"
end
hangman :id => "hangman" do
  word_area :id => "word_area" do
  end
end
status :id => "status"
letters do
  ("A".."M").each do |l|
    letter :text => l
  end
end
letters do
  ("N".."Z").each do |l|
    letter :text => l
  end
end
footer do
  limelight_logo
  copyright :text => "Copyright 2009 8th Light, Inc. All rights reserved."
end