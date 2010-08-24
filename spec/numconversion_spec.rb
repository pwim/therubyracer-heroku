require File.dirname(__FILE__) + '/spec_helper'

describe "weird number conversion" do
  it "doesn't seem to convert large numbers properly" do
    V8::Context.new do |cxt|
      cxt['deadbeef'] = 0xDEADBEEF
      cxt['deadbeef'].should == 0xDEADBEEF
    end
  end
end