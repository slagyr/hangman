require File.expand_path(File.dirname(__FILE__) + "/spec_helper")

describe "Word Area Players" do

  uses_scene "default_scene", :hidden => true

  it "update word" do
    scene.word_area.update_word("Th_s_sATest")

    spaces = scene.word_area.children
    spaces[0].text.should == "T"
    spaces[1].text.should == "H"
    spaces[2].text.should == " "
    spaces[3].text.should == "S"
    spaces[4].text.should == " "
    spaces[5].text.should == "S"
    spaces[6].text.should == "A"
    spaces[7].text.should == "T"
    spaces[8].text.should == "E"
    spaces[9].text.should == "S"
    spaces[10].text.should == "T"
  end

  it "should update existing word" do
    scene.word_area.update_word("___________")
    scene.word_area.update_word("Th_s_sATest")

    spaces = scene.word_area.children
    spaces[0].text.should == "T"
    spaces[1].text.should == "H"
    spaces[2].text.should == " "
    spaces[3].text.should == "S"
    spaces[4].text.should == " "
    spaces[5].text.should == "S"
    spaces[6].text.should == "A"
    spaces[7].text.should == "T"
    spaces[8].text.should == "E"
    spaces[9].text.should == "S"
    spaces[10].text.should == "T"
  end
end

