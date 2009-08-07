require File.expand_path(File.dirname(__FILE__) + "/spec_helper")

describe "Hangman Players" do

  uses_scene "default_scene", :hidden => true

  before do
    scene.hangman.casted
  end

  it "should start with blank gallows" do
    scene.hangman.style.background_image.should == "images/hangman_0.png"
  end

  it "should increment the hangman on misses" do
    scene.hangman.miss
    scene.hangman.style.background_image.should == "images/hangman_1.png"
    scene.hangman.miss
    scene.hangman.style.background_image.should == "images/hangman_2.png"
  end

  it "should reset the hangman" do
    scene.hangman.miss
    scene.hangman.reset

    scene.hangman.style.background_image.should == "images/hangman_0.png"
  end
end

