# This file (stages.rb) is used to define the stages within your production.
#
# Below is an example statge configuration.
#
#  stage "center_stage" do
#    default_scene "main"
#    title "Limelight Center Stage"
#    location [0, 0]
#    size [300, 800]
#  end

stage "default" do
  default_scene "default_scene"
  title "Hangman"
  location [200, 25]
  size [550, 550]
  framed false
  background_color "transparent"
end

stage "devtool" do
  default_scene "devtool"
  title "Dev Tool"
  location [50, 25]
  size [100, 100]
  background_color "transparent"
  framed false
end

