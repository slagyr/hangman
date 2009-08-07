require File.expand_path(File.dirname(__FILE__) + "/spec_helper")

describe "Production" do

  uses_scene "default_scene", :hidden => true, :stage => "default"

  it "should be the game engine's UI" do
    production.production_opening
    scene
    production.production_opened

    production.game_engine.ui.should == scene
  end

end