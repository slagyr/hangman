profile :id => "profile" do
  title :text => "Dossier"
  stat_label :text => "Name:"
  stat_result :text => "No player selected", :id => "player_name"

  stat_label :text => "Author:"
  stat_result :text => "", :id => "author_name"

  stat_label :text => "Profile:"
  stat_result :text => "", :id => "description"

  stat_label :text => "Overall Score:"
  stat_result do
    result_graph :id => "average_graph"
  end

  stat_label :text => "Play Record:"
  stat_result do
    result_graph :id => "play_graph"
  end

  stat_label :text => "Time Score:"
  stat_result do
    result_graph :id => "time_graph"
  end

  stat_label :text => "Simplicity Score:"
  stat_result  do
    result_graph :id => "simplicity_graph"
  end

  stat_label :text => "Test Coverage:"
  stat_result do
    result_graph :id => "coverage_graph"
  end

  stat_label :text => "Flog Score:"
  stat_result do
    result_graph :id => "flog_graph"
  end

  stat_label :text => "Saikuro Score:"
  stat_result do
    result_graph :id => "saikuro_graph"
  end

  stat_label :text => "Flay Score:"
  stat_result do
    result_graph :id => "flay_graph"
  end

  buttons do
    evaulate_button :id => "evaluate_button", :text => "Perform Analysis", :on_mouse_clicked => "scene.find('profile').perform_analysis"
    evaulate_button :id => "compete_button", :text => "Play 5 Games", :on_mouse_clicked => "scene.play_hangman(5)"
  end
end