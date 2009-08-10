require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'hangman/analyzers/play_analyzer'
require 'hgnaman/player_profile'

describe Hangman::Analyzers::PlayAnalyzer do

  before(:all) do
    self.producer #load the production
  end

#  it "should test play of the Random Player" do
#    profile = Hangman::PlayerProfile.load_from_gem('rear_admiral_randy')
#    Hangman::Server.should_receive(:profile).with("Rear Admiral Randy").and_return(Hangman::PlayerProfile.new(:games_played => 100, :wins => 50))
#
#    score, description = Hangman::Analyzers::PlayAnalyzer.analyze(profile)
#
#    score.should == 50
#    description.should == "50 : won 50 of 100 games played"
#  end
#
#  it "should return 50 is server error" do
#    profile = Hangman::PlayerProfile.load_from_gem('rear_admiral_randy')
#    Hangman::Server.should_receive(:profile).with("Rear Admiral Randy").and_raise(Hangman::ServerException.new("server down"))
#
#    score, description = Hangman::Analyzers::PlayAnalyzer.analyze(profile)
#
#    score.should == 50
#    description.should == "50 : Couldn't retreive record"
#  end

end