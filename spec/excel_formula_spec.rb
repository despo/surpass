require File.dirname(__FILE__) + '/spec_helper'


describe ExcelFormula, "parsing primary objects" do
  it "should parse the TRUE constant" do
    ExcelFormula.new("TRUE").to_biff.should eql("\002\000\035\001")
  end
  
  it "should parse minus TRUE" do
    File.open("out.bin", "w") do |f|
      f.write ExcelFormula.new("-TRUE").to_biff
    end
    ExcelFormula.new("-TRUE").to_biff.should eql("\003\000\035\001\023")
  end
  
  it "should parse FALSE constant" do
    ExcelFormula.new("FALSE").to_biff.should eql("\002\000\035\000")
  end
  
  it "should parse a product" do
    ExcelFormula.new("TRUE*TRUE").to_biff
  end

  it "should raise an error if invalid formula is passed" do
    lambda { ExcelFormula.new("RUBBISHXYZ") }.should raise_error
  end
end
