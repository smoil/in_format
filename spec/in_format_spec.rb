require "spec_helper"

describe InFormat do

  it "truth" do
    InFormat.class.should eq(Module)
  end

  it "unintialized value should be nil" do
    beaver = Beaver.new
    beaver.phone.should be_nil
  end

  it "created with '2223334444'" do
    beaver = Beaver.create(phone: "2223334444")
    beaver.phone.should eq "222-333-4444"
    beaver.phone(true).should eq "2223334444"
  end

  it "created with '1 213 645 1212 ext 41'" do
    beaver = Beaver.create(phone: "1 213 645 1212 ext 41")
    beaver.phone.should eq "1-213-645-1212 x41"
    beaver.phone(true).should eq "12136451212x41"
  end

  it "created with '1 (213) 645-1212 41'" do
    beaver = Beaver.create(phone: "1 (213) 645-1212 x41")
    beaver.phone.should eq "1-213-645-1212 x41"
    beaver.phone(true).should eq "12136451212x41"
  end

  it "with a custom scrubber" do
    beaver = Beaver.create(custom_phone: "1 (333) 645-1212 x41")
    beaver.custom_phone(true).should eq "1 (999) 645-1212 x41"
  end

  it "with a custom scrubber and formatter" do
    beaver = Beaver.create(custom_phone: "1 (333) 645-1212 x41")
    beaver.custom_phone.should eq "1 (PPP) 645-1212 x41"
  end

end