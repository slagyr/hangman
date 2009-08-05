require File.expand_path(File.dirname(__FILE__) + "/spec_helper")

describe "Default Scene" do

  uses_scene "default_scene", :hidden => true

  it "should close" do
    scene.stage.should_receive(:close)

    scene.close
  end

end