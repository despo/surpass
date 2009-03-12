require File.dirname(__FILE__) + '/spec_helper'

describe Alignment do
  before(:each) do
    @a = Alignment.new
  end

  it "should not wrap text by default" do
    @a.wrap.should eql(Alignment::NOT_WRAP_AT_RIGHT)
  end

  it "should wrap text when wrap = true" do
    @a.wrap = true
    @a.wrap.should eql(Alignment::WRAP_AT_RIGHT)
  end
  
  it "should wrap text when wrap = WRAP_AT_RIGHT" do
    @a.wrap = Alignment::WRAP_AT_RIGHT
    @a.wrap.should eql(Alignment::WRAP_AT_RIGHT)
  end
  
  it "should not wrap text when wrap = false" do
    @a.wrap = true
    @a.wrap = false
    @a.wrap.should eql(Alignment::NOT_WRAP_AT_RIGHT)
  end

  it "should not wrap text when wrap = NOT_WRAP_AT_RIGHT" do
    @a.wrap = true
    @a.wrap = Alignment::NOT_WRAP_AT_RIGHT
    @a.wrap.should eql(Alignment::NOT_WRAP_AT_RIGHT)
  end
  
  it "should raise an error if anything else passed" do
    lambda {@a.wrap = :yes}.should raise_error("I don't know how to set wrap to :yes")
  end
end
