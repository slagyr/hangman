require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'hangman/analyzers/simplicity_analyzer'
require 'hangman/player_profile'

describe Hangman::Analyzers::SimplicityAnalyzer do

  before(:all) do
    self.producer #load the production
  end

  it "should check simplicity of the Random Player" do
    profile = Hangman::PlayerProfile.load_from_gem('hangman_letter_letdown')

    score, description = Hangman::Analyzers::SimplicityAnalyzer.analyze(profile)

    score.should == 100
    description.should == "100 : 51 LOC"
  end

  it "should be logarithmic" do
    Hangman::Analyzers::SimplicityAnalyzer.score_for_lines(100).to_i.should == 100
    Hangman::Analyzers::SimplicityAnalyzer.score_for_lines(120).to_i.should == 94
    Hangman::Analyzers::SimplicityAnalyzer.score_for_lines(200).to_i.should == 77
    Hangman::Analyzers::SimplicityAnalyzer.score_for_lines(400).to_i.should == 59
    Hangman::Analyzers::SimplicityAnalyzer.score_for_lines(800).to_i.should == 45
    Hangman::Analyzers::SimplicityAnalyzer.score_for_lines(1600).to_i.should == 36
  end

end