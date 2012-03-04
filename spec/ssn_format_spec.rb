require "spec_helper"

describe "ssn_format" do

  describe "a field using ssn_format" do
    context "that is unitialized" do
      let(:beaver) { Beaver.new }

      it "should return nil when read through getter" do
        beaver.ssn.should be_nil
      end

      it "should return nil when read without getter" do
        beaver.ssn(true).should be_nil
      end
    end

    context "initialized with '222 22 2222'" do
      let(:beaver) { Beaver.new(ssn: "222 22 2222") }

      it "should store a value processed by the default setter" do
        beaver.ssn(true).should eq("222222222")
      end

      it "should return a value processed by the default getter" do
        beaver.ssn.should eq("222-22-2222")
      end
    end
  end

  describe "a field using ssn_format with a custom setter" do
    let(:beaver) { Beaver.new(ssn_custom_set: "333333333") }

    it "should store a value processed by the custom setter" do
      beaver.ssn_custom_set(true).should eq("999999999")
    end

    it "should return a value processed by the default getter" do
      beaver.ssn_custom_set.should eq("999-99-9999")
    end
  end

  describe "a field using ssn_format with a custom getter" do
    let(:beaver) { Beaver.new(ssn_custom_get: "999 99 9999") }

    it "should store a value processed by the default setter" do
      beaver.ssn_custom_get(true).should eq("999999999")
    end

    it "should return a value processed by the custom getter" do
      beaver.ssn_custom_get.should eq("PPPPPPPPP")
    end
  end
end