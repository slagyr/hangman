require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'hangman/analyzers/saikuro_analyzer'
require 'hangman/player_profile'

describe Hangman::Analyzers::FlogAnalyzer do

  before(:all) do
    self.producer #load the production
  end

  it "should measure cyclomatic complexity of the Random Player" do
    profile = Hangman::PlayerProfile.load_from_gem('hangman_letter_letdown')

    score, description = Hangman::Analyzers::SaikuroAnalyzer.analyze(profile)

puts "score, description: #{score} , #{description}"    

    score.should == 99
    description.should == "99 : 1 pts excessive complexity"
  end

end