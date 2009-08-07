default_scene {
  background_color :grey
  secondary_background_color :black
  gradient :on
  gradient_penetration "30%"
  gradient_angle 270
  horizontal_alignment :center
  vertical_alignment :top
  width "100%"
  height "100%"
  rounded_corner_radius 25
  padding 14
  border_width 1
  border_color :black
}

title {
  background_image "images/title.png"
  width 416
  height 90
}

menu {
  width "100%"
  height 39
  horizontal_alignment :center
  vertical_alignment :center
}

menu_item {
  width 100
  text_color "#2661da"
  font_size 14
  font_face :arial
  font_style :bold
  hover {
    text_color :white
  }
}

hangman {
  width "100%"
  height 250
  background_image "images/hangman_0.png"
  background_image_fill_strategy :static
  background_image_x :center
  background_image_y :center
  horizontal_alignment :center
  vertical_alignment :center
}

word_space {
  text_color :white
  font_face "arial"
  font_size 29
  padding 1
  margin 7
  border_color :white
  bottom_border_width 3
  width 40
  height 60
  horizontal_alignment :center
  vertical_alignment :center
}

status {
  width "100%"
  height 40
  horizontal_alignment :center
  vertical_alignment :center
  text_color "#2661da"
  font_face :arial
  font_size 12
}

letters {
  width "100%"
}

letter {
  width 40
  height 40
  font_face :arial
  font_size 30
  text_color :white
  alignment :center
  hover {
    background_color "#2661da"
    secondary_background_color :black
    gradient :on
    gradient_angle 270
    rounded_corner_radius 10
  }
}

footer {
  width "100%"
  height 20
}

limelight_logo {
  width "50%"
  height "100%"
  background_image "images/limelight.png"
  background_image_fill_strategy :static
  background_image_y :center
}

copyright {
  width "50%"
  height "100%"
  font_face :arial
  font_size 8
  text_color :grey
  horizontal_alignment :right
  vertical_alignment :bottom
}