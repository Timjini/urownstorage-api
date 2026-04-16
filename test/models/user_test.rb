require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    # Password criteria: 8 chars, 1 Uppercase, 1 Digit
    @valid_password = "Password123"
    @user = User.new(email: "dev@urownstorage.com", password: @valid_password)
  end

  test "should be valid with a complex password" do
    assert @user.valid?, @user.errors.full_messages.to_sentence
  end

  test "password_digest should be present and hashed after save" do
    @user.save
    assert_not_nil @user.password_digest
    assert_not_equal @valid_password, @user.password_digest
  end

  test "authenticate returns user for correct password" do
    @user.save
    assert @user.authenticate(@valid_password)
  end

  test "password must be at least 8 characters" do
    @user.password = "Pass1"
    assert_not @user.valid?
    assert_includes @user.errors[:password], "is too short (minimum is 8 characters)"
  end

  test "password must include an uppercase letter" do
    @user.password = "password123"
    assert_not @user.valid?
    assert_includes @user.errors[:password], "must include at least one uppercase letter and one digit"
  end

  test "password must include a digit" do
    @user.password = "Password"
    assert_not @user.valid?
    assert_includes @user.errors[:password], "must include at least one uppercase letter and one digit"
  end

  test "email should be saved as lowercase" do
    mixed_case_email = "Foo@ExAmPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
end
