require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_truth
    assert true
  end
  
  def test_pwd_blank
    user = User.new
    blank = (user.password = '')
    assert_nil user.hashed_password
  end
  
  def test_pwd_encrypts
    user = User.new
    not_blank = (user.password = 'a')
    assert_equal not_blank, 'a'
    assert_not_nil user.hashed_password
  end
end