require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'letter_letdown/letter_letdown'

describe LetterLetdown::LetterLetdown do

  it "should be instantiable with no paramters" do

    lambda { LetterLetdown::LetterLetdown.new }.should_not raise_error

  end

end