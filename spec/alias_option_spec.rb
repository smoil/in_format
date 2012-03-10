require "spec_helper"

describe "alias_option_spec" do

  describe "using in_format with the alias option" do
    let(:beaver) { Beaver.new(alias_me: "trouser_snake") }

    # it "should alias the setter with an underscore" do
    #   beaver._alias_me=("cow").should eq("cow")
    # end
    #
    # it "should alias the getter with an underscore" do
    #   beaver._alias_me.should eq("TrouserSnake")
    # end

    it "should override the setter" do
      beaver.alias_me(true).should eq("TrouserSnake")
    end

    it "should override the getter" do
      beaver.alias_me.should eq("TROUSERSNAKE")
    end
  end

end