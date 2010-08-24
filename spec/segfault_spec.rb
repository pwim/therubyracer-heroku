require File.dirname(__FILE__) + '/spec_helper'

describe "the segfault" do
  it "happens when a native method throws an exception when called from within an extended prototype" do
    constructor = Class.new
    constructor.class_eval do
      def detonate(*a)
        raise "BOOM!"
      end
    end
    V8::Context.new do |cxt|
      cxt['Boom'] = constructor
      cxt['puts'] = method(:puts)
      cxt.eval(<<-JS, "eval")
Boom.prototype.boom = function() {
  this.detonate()
}
var go = new(Boom)()
try {
  go.boom()
} catch (e) {
}
puts("no problem")
go.boom()
JS
    end
  end
end