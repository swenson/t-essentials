require File.dirname(__FILE__) + '/../test_helper'

class RegionsControllerTest < ActionController::TestCase
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
    assert_not_nil assigns(:regions)
    logout
  end

  def test_should_get_new
    login
    get :new
    assert_response :success
    logout
  end

  def test_should_create_region
    login
    assert_difference('Region.count') do
      post :create, :region => { }
    end

    assert_redirected_to region_path(assigns(:region))
    logout
  end

  def test_should_show_region
    login
    get :show, :id => regions(:one).id
    assert_response :success
    logout
  end

  def test_should_get_edit
    login
    get :edit, :id => regions(:one).id
    assert_response :success
    logout
  end

  def test_should_update_region
    login
    put :update, :id => regions(:one).id, :region => { }
    assert_redirected_to region_path(assigns(:region))
    logout
  end

  def test_should_destroy_region
    login
    assert_difference('Region.count', -1) do
      delete :destroy, :id => regions(:one).id
    end

    assert_redirected_to regions_path
    logout
  end
end
