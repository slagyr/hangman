require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'hangman/analyzers/flog_analyzer'
require 'hangman/player_profile'

describe Hangman::Analyzers::FlogAnalyzer do
  
  it "should flog the Random Player" do
    profile = Hangman::PlayerProfile.load_from_gem('hangman_letter_letdown')

    score, description = Hangman::Analyzers::FlogAnalyzer.analyze(profile)

    score.should == 100
    description.should == "100 : 2/2 methods pass"
  end

end