require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'hangman/analyzers/flay_analyzer'
require 'hangman/player_profile'

describe Hangman::Analyzers::FlayAnalyzer do

  before(:all) do
    self.producer #load the production
  end

  it "should flay the Random Player" do
    profile = Hangman::PlayerProfile.load_from_gem('micahs_fury')

    score, description = Hangman::Analyzers::FlayAnalyzer.analyze(profile)

    score.should == 100
    description.should == "100 : 0 duplication mass"
  end

end