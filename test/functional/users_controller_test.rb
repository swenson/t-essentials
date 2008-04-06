require File.dirname(__FILE__) + '/../test_helper'

class UsersControllerTest < ActionController::TestCase
  def login
    @request.session[:user_id] = 1
  end
  
  def logout
    @request.session[:user_id] = nil
  end

  def test_should_get_index
    login
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
    logout
  end

  def test_should_get_new
    login
    get :new
    assert_response :success
    logout
  end

  def test_should_create_user
    login
    assert_difference('User.count') do
      post :create, :user => { :name => 'q', :password => 'a', :password_confirmation => 'a'}
    end

    assert_redirected_to user_path(assigns(:user))
    logout
  end
  
  def test_should_not_create_user
    login
    count = User.count
    post :create, :user => { }
    assert_equal count, User.count
    logout
  end
  

  def test_should_show_user
    login
    get :show, :id => users(:one).id
    assert_response :success
    logout
  end

  def test_should_get_edit
    login
    get :edit, :id => users(:one).id
    assert_response :success
    logout
  end

  def test_should_update_user
    login
    put :update, :id => users(:one).id, :user => { }
    assert_redirected_to user_path(assigns(:user))
    logout
  end

  def test_should_destroy_user
    login
    assert_difference('User.count', -1) do
      delete :destroy, :id => users(:one).id
    end

    assert_redirected_to users_path
    logout
  end
end
