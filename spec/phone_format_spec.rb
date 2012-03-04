require "spec_helper"

describe "phone_format" do

  describe "a field using phone_format" do
    context "that is unitialized" do
      let(:beaver) { Beaver.new }

      it "should return nil when read through getter" do
        beaver.phone.should be_nil
      end

      it "should return nil when read without getter" do
        beaver.phone(true).should be_nil
      end
    end

    context "initialized with '2223334444'" do
      let(:beaver) { Beaver.new(phone: "2223334444") }

      it "should store a value processed by the default setter" do
        beaver.phone(true).should eq("2223334444")
      end

      it "should return a value processed by the default getter" do
        beaver.phone.should eq("222-333-4444")
      end
    end

    context "initialized with '1 213 645 1212 ext 41'" do
      let(:beaver) { Beaver.new(phone: "1 213 645 1212 ext 41") }

      it "should store a value processed by the default setter" do
        beaver.phone(true).should eq("12136451212x41")
      end

      it "should return a value processed by the default getter" do
        beaver.phone.should eq("1-213-645-1212 x41")
      end
    end

    context "initialized with '1 (213) 645-1212 x41'" do
      let(:beaver) { Beaver.new(phone: "1 (213) 645-1212 x41") }

      it "should store a value processed by the default setter" do
        beaver.phone(true).should eq("12136451212x41")
      end

      it "should return a value processed by the default getter" do
        beaver.phone.should eq("1-213-645-1212 x41")
      end
    end
  end

  describe "a field using phone_format with a custom setter" do
    let(:beaver) { Beaver.new(phone_custom_set: "1(333)645-1212x41") }

    it "should store a value processed by the custom setter" do
      beaver.phone_custom_set(true).should eq("1(999)645-1212x41")
    end

    it "should return a value processed by the default getter" do
      beaver.phone_custom_set.should eq("1(999)645-1212x41")
    end
  end

  describe "a field using phone_format with a custom getter" do
    let(:beaver) { Beaver.new(phone_custom_get: "1(999)645-1212x41") }

    it "should store a value processed by the default setter" do
      beaver.phone_custom_get(true).should eq("19996451212x41")
    end

    it "should return a value processed by the custom getter" do
      beaver.phone_custom_get.should eq("1PPP6451212x41")
    end
  end

end