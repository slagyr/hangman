require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'hangman/server'

describe Hangman::Server do

  before(:each) do
    $USE_SERVER = true
  end

  after(:each) do
    $USE_SERVER = false
  end

  it "should register and retrieve profiles" do
    profile = Hangman::PlayerProfile.load_from_gem('hangman_letter_letdown')

    Hangman::Server.register_profile(profile)

    profile = Hangman::Server.profile("Letter Letdown")
    profile.author.should == "Micah Martin"
  end

end