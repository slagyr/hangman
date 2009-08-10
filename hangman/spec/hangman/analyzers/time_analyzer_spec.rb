require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'hangman/analyzers/time_analyzer'
require 'hangman/player_profile'

describe Hangman::Analyzers::TimeAnalyzer do

  before(:all) do
    self.producer #load the production
  end

  it "should test time of the Random Player" do
    profile = Hangman::PlayerProfile.load_from_gem('hangman_letter_letdown')
    Hangman::Server.should_receive(:profile).with("Letter Letdown").and_return(Hangman::PlayerProfile.new(:games_played => 100, :time_used => 50))

    score, description = Hangman::Analyzers::TimeAnalyzer.analyze(profile)

    score.should == 50
    description.should == "50 : 0.5 sec/game"
  end

  it "should return 50 is server error" do
    profile = Hangman::PlayerProfile.load_from_gem('hangman_letter_letdown')
    Hangman::Server.should_receive(:profile).with("Letter Letdown").and_raise(Exception.new("server down"))

    score, description = Hangman::Analyzers::TimeAnalyzer.analyze(profile)

    score.should == 50
    description.should == "50 : Couldn't retreive record"
  end

end