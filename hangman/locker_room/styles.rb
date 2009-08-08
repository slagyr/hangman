
locker_room {
  background_color :grey
  secondary_background_color :black
  gradient_angle 270
  gradient :on
  gradient_penetration "30%"
  horizontal_alignment :center
  vertical_alignment :top
  width "100%"
  height "100%"
  rounded_corner_radius 15
  border_width 1
  border_color :black
  padding 5
}

close_link {
  text_color :white
  font_size 10
  width "100%"
  horizontal_alignment :right
  hover {
    font_style "bold"
  }
}

title {
  width "100%"
  horizontal_alignment :center
  text_color :white
  font_size 15
  font_face :courier_new
  font_style "bold"
}

profile {
  width "100%"
}

stat_label {
  width "30%"
  text_color "#2661da"
  font_size 10
  font_face :courier_new
  top_margin 10
}

stat_result {
  width "70%"
  top_margin 10
  left_margin 10
  text_color :white
  font_size 10
  font_face :courier_new
  max_height 45
}

result_graph {
  width "100%"
  height 12
  border_color :dark_gray
  border_width 1
  rounded_corner_radius 4
  background_color :white
}

result_graph_bar {
  background_color :green
  width "100%"
  height "100%"
}

result_graph_text {
  float :on
  width "100%"
  height "100%"
  x 0
  y 0
  text_color :black
  font_size 9
  font_face :courier_new
  horizontal_alignment :center
  vertical_alignment :center
}

player_list {
  vertical_scrollbar :on
  width "100%"
  height 200
}

player_list_item {
  width "100%"
  border_color :grey
  border_width 1
  rounded_corner_radius 3
  margin 3
  padding 3
}

player_text {
  text_color :white
  font_face :courier_new
  font_size 12
}

player_name {
  extends :player_text
  width "80%"
}

player_score {
  extends :player_text
  width "20%"
}

buttons {
  width "100%"
  top_padding 10
  horizontal_alignment :right
}

evaulate_button {
  border_width 1
  border_color "#2661da"
  rounded_corner_radius 4
  background_color :transparent
  text_color "#2661da"
  font_size 12
  font_face "courier_new"
  padding 5
  horizontal_alignment :center
  hover {
    background_color :white
  }
}

action_link {
  text_color :white
  font_size 20
  font_face :arial
  left_padding 20
  right_padding 20
  left_margin 20
  right_margin 20
  border_color :white
  border_width 2
  rounded_corner_radius 4
}

main_menu_link {
  extends :action_link
  hover {
    border_color :blue
  }
}

actions {
  width "100%"
  top_margin 20
}

curtains {
  width "100%"
  height "100%"
  background_color "#000C"
  float :on
  x 0
  y 0
  horizontal_alignment :center
  vertical_alignment :center
}

curtains_text {
  text_color "#5cc31e"
  font_face :arial
  font_size 25
}