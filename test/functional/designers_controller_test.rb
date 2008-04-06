require File.dirname(__FILE__) + '/../test_helper'

class DesignersControllerTest < ActionController::TestCase
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
    assert_not_nil assigns(:designers)
    logout
  end

  def test_should_get_new
    login
    get :new
    assert_response :success
    logout
  end

  def test_should_create_designer
    login
    assert_difference('Designer.count') do
      post :create, :designer => { }
    end

    assert_redirected_to designer_path(assigns(:designer))
    logout
  end

  def test_should_show_designer
    login
    get :show, :id => designers(:one).id
    assert_response :success
    logout
  end

  def test_should_get_edit
    login
    get :edit, :id => designers(:one).id
    assert_response :success
    logout
  end

  def test_should_update_designer
    login
    put :update, :id => designers(:one).id, :designer => { }
    assert_redirected_to designer_path(assigns(:designer))
    logout
  end

  def test_should_destroy_designer
    login
    assert_difference('Designer.count', -1) do
      delete :destroy, :id => designers(:one).id
    end

    assert_redirected_to designers_path
    logout
  end
end
