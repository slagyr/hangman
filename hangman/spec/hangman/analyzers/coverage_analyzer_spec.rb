require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'hangman/analyzers/coverage_analyzer'
require 'hangman/player_profile'

describe Hangman::Analyzers::CoverageAnalyzer do

  before(:all) do
    self.producer #load the production
  end

#  it "should test coverage the Random Player" do
#    profile = Battleship::PlayerProfile.load_from_gem('rear_admiral_randy')
#
#    score, description = Battleship::Analyzers::CoverageAnalyzer.analyze(profile)
#
#    score.should == 20
#    description.should == "20 : 20% test coverage"
#  end

end