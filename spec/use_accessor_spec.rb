require "spec_helper"

describe "use_accessor" do

  describe "using in_format with the use_accessor option" do
    let(:beaver) { Beaver.new(accessor_method: "trouser_snake") }

    it "should override the setter" do
      beaver.accessor_method(true).should eq("TrouserSnake")
    end

    it "should override the getter" do
      beaver.accessor_method.should eq("TROUSERSNAKE")
    end
  end

end