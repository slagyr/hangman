require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'hangman/player_profile'

describe Hangman::PlayerProfile do

  it "should construct from hash" do
    profile = Hangman::PlayerProfile.new(:name => "Bill", :description => "blah", :author => "Author")

    profile.name.should == "Bill"
    profile.description.should == "blah"
    profile.author.should == "Author"
  end

  it "should have zero scores to start with" do
    profile = Hangman::PlayerProfile.new()

    profile.flog_score.should == 0
    profile.coverage_score.should == 0
    profile.simplicity_score.should == 0
    profile.play_score.should == 0
  end

  it "should perform analysis" do
    profile = Hangman::PlayerProfile.new()

    Hangman::Analyzers::PlayAnalyzer.should_receive(:analyze).with(profile)
    Hangman::Analyzers::SimplicityAnalyzer.should_receive(:analyze).with(profile)
    Hangman::Analyzers::FlogAnalyzer.should_receive(:analyze).with(profile)
    Hangman::Analyzers::CoverageAnalyzer.should_receive(:analyze).with(profile)

    profile.perform_analysis(mock("observer", :null_object => true))
  end

  it "should notify the observer while analyzing" do
    profile = Hangman::PlayerProfile.new()
    profile.stub!(:average_score).and_return(25)
    Hangman::Analyzers::PlayAnalyzer.stub!(:analyze).with(profile).and_return([10, "battle"])
    Hangman::Analyzers::SimplicityAnalyzer.stub!(:analyze).with(profile).and_return([20, "simple"])
    Hangman::Analyzers::FlogAnalyzer.stub!(:analyze).with(profile).and_return([30, "flog"])
    Hangman::Analyzers::CoverageAnalyzer.stub!(:analyze).with(profile).and_return([40, "coverage"])
    Hangman::Analyzers::SaikuroAnalyzer.stub!(:analyze).with(profile).and_return([55, "saikuro"])
    Hangman::Analyzers::FlayAnalyzer.stub!(:analyze).with(profile).and_return([56, "flay"])
    Hangman::Analyzers::TimeAnalyzer.stub!(:analyze).with(profile).and_return([57, "time"])

    observer = mock("observer")
    observer.should_receive(:update_play_score).with(10, "battle")
    observer.should_receive(:update_simplicity_score).with(20, "simple")
    observer.should_receive(:update_flog_score).with(30, "flog")
    observer.should_receive(:update_coverage_score).with(40, "coverage")
    observer.should_receive(:update_average_score).with(25)
    observer.should_receive(:update_saikuro_score).with(55, "saikuro")
    observer.should_receive(:update_flay_score).with(56, "flay")
    observer.should_receive(:update_time_score).with(57, "time")

    profile.perform_analysis(observer)
  end

  it "should load profiles from gems" do
    profiles = Hangman::PlayerProfile.load_from_gems
    profiles.length.should >= 1

    letter_letdown = profiles.find {|p| p.name == "Letter Letdown" }
    letter_letdown.should_not == nil
    letter_letdown.root_path.should == "/opt/local/lib/ruby/gems/1.8/gems/hangman_letter_letdown-1.0"
  end

  it "should instantiate a player" do
    profile = Hangman::PlayerProfile.load_from_gem("hangman_letter_letdown")

    player = profile.create_player

    player.class.name.should == "LetterLetdown::LetterLetdown"
  end

end