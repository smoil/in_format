require "test_helper"

class PhoneFormatTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, PhoneFormat
  end

  test "unintialized value should be nil" do
    beaver = Beaver.new
    assert_equal nil, beaver.phone
  end

  test "created with '2223334444'" do
    beaver = Beaver.create(phone: "2223334444")
    assert_equal "222-333-4444", beaver.phone
    assert_equal "2223334444", beaver.phone(true)
  end

  test "created with '1 213 645 1212 ext 41'" do
    beaver = Beaver.create(phone: "1 213 645 1212 ext 41")
    assert_equal "1-213-645-1212 x41", beaver.phone
    assert_equal "12136451212x41", beaver.phone(true)
  end

  test "created with '1 (213) 645-1212 41'" do
    beaver = Beaver.create(phone: "1 (213) 645-1212 x41")
    assert_equal "1-213-645-1212 x41", beaver.phone
    assert_equal "12136451212x41", beaver.phone(true)
  end

  test "with a custom scrubber" do
    beaver = Beaver.create(custom_phone: "1 (333) 645-1212 x41")
    assert_equal "1 (999) 645-1212 x41", beaver.custom_phone(true)
  end

  test "with a custom scrubber and formatter" do
    beaver = Beaver.create(custom_phone: "1 (333) 645-1212 x41")
    assert_equal "1 (PPP) 645-1212 x41", beaver.custom_phone
  end

end
