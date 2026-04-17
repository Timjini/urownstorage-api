require "test_helper"

class AddressTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @address = addresses(:one)
  end

  test "should require addressable association" do
    @address.addressable
    assert_not @address.valid?
  end

  test "should create address with addressable association User" do
    @address.addressable_type = @user.class.name.to_s
    @address.addressable_id = @user.id
    assert @address.valid?
  end

  test "shouldn't create and address without title" do
    @address.title = ""
    assert_not @address.valid?
    assert_includes @address.errors[:title], "can't be blank"
  end

  test "shouldn't create and address without address1" do
    @address.address1 = ""
    assert_not @address.valid?
    assert_includes @address.errors[:address1], "can't be blank"
  end

  test "city should be present" do
    @address.city = ""
    assert_not @address.valid?
    assert_includes @address.errors[:city], "can't be blank"
  end

  test "city should be at least 2 characters" do
    @address.city = "A"
    assert_not @address.valid?
    assert_includes @address.errors[:city], "is too short (minimum is 2 characters)"
  end

  test "directions should be at least 8 characters" do
    @address.directions = "short"
    assert_not @address.valid?
    assert_includes @address.errors[:directions], "is too short (minimum is 8 characters)"
  end

  test "directions should accept blank" do
    @address.directions = nil
    @address.addressable_type = @user.class.name.to_s
    @address.addressable_id = @user.id
    assert @address.valid?
  end

  test "directions should be max 200 characters" do
    @address.directions = "a" * 201
    assert_not @address.valid?, "Address should be invalid with > 200 chars"
    assert_includes @address.errors[:directions], "is too long (maximum is 200 characters)"
  end
end
