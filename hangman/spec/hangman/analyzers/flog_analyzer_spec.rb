require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'hangman/analyzers/flog_analyzer'
require 'hangman/player_profile'

describe hangman::Analyzers::FlogAnalyzer do

  before(:all) do
    self.producer #load the production
  end

  it "should flog the Random Player" do
    profile = Hangman::PlayerProfile.load_from_gem('rear_admiral_randy')

    score, description = Hangman::Analyzers::FlogAnalyzer.analyze(profile)

    score.should == 81
    description.should == "81 : 22/27 methods pass"
  end

end