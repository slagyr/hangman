require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'hangman_tournament/submit'

describe HangmanTournament::Submit do

  before(:all) do
    ENV['GEM_PATH'] = '/opt/local/lib/ruby/gems/1.8'
    Gem.clear_paths
  end

  before(:each) do
    @submit = HangmanTournament::Submit.new("letter_letdown")
  end

  it "should read a gem file" do
    result = @submit.collect_data

    result[:name].should == "Letter Letdown"
    result[:author].should == "Micah Martin"
    result[:email].should == "micah@8thlight.com"
    result[:description].should == "A very simple player."
    result[:gem_file_name].should == "letter_letdown-1.0.gem"
    result[:gem_content].should == IO.read("/opt/local/lib/ruby/gems/1.8/cache/letter_letdown-1.0.gem")
  end

  it "should get password" do
    $stdout.should_receive(:puts).with("Password?")
    $stdout.should_receive(:print).with("> ")
    $stdin.should_receive(:readline).and_return("blah")

    password = @submit.get_password

    password.should == "blah"
  end

end