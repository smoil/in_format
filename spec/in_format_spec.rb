require "spec_helper"

describe InFormat do

  it "truth" do
    InFormat.class.should eq(Module)
  end

  describe "an ActiveRecord object" do
    context "with a field that has a getter and setter defined" do
      let(:beaver) { Beaver.new(name: "american_beaver") }

      it "should store a value processed by the setter" do
        beaver.name(true).should eq("AMERICAN_BEAVER")
      end

      it "should return a value processed by the getter" do
        beaver.name.should eq("AMERICANBeaver")
      end
    end

    context "with a field that only has a getter defined" do
      let(:beaver) { Beaver.new(name_no_set: "american_beaver") }

      it "should store a value processed by the setter" do
        beaver.name_no_set(true).should eq("american_beaver")
      end

      it "should return a value processed by the getter" do
        beaver.name_no_set.should eq("AmericanBeaver")
      end
    end

    context "with a field that only has a setter defined" do
      let(:beaver) { Beaver.new(name_no_get: "american_beaver") }

      it "should return a value processed by the getter" do
        beaver.name_no_get.should eq("AMERICAN_BEAVER")
      end
    end
  end

end