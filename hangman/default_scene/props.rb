title
menu do
  menu_item :text => "Close", :on_mouse_click => "scene.close"
  menu_item :text => "New Game", :on_mouse_click => "scene.new_game" 
end
hangman do

end
status
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