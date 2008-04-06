require File.dirname(__FILE__) + '/../test_helper'

require 'adsizes_controller'

class AdsizesControllerTest < ActionController::TestCase 
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
    assert_not_nil assigns(:adsizes)
    logout
  end

  def test_should_get_new
    login
    get :new
    assert_response :success
    logout
  end

  def test_should_create_adsize
    login
    assert_difference('Adsize.count') do
      post :create, :adsize => { :numlistings => 1, :adsize => 'third'}
    end

    assert_redirected_to adsize_path(assigns(:adsize))
    logout
  end

  def test_should_not_create_adsize
    login
    count = Adsize.count
    post :create, :adsize => { }
    assert_equal count, Adsize.count
 
    logout
  end


  def test_should_show_adsize
    login
    get :show, :id => adsizes(:half).id
    assert_response :success
    logout
  end

  def test_should_get_edit
    login
    get :edit, :id => adsizes(:half).id
    assert_response :success
    logout
  end

  def test_should_update_adsize
    login
    put :update, :id => adsizes(:half).id, :adsize => { }
    assert_redirected_to adsize_path(assigns(:adsize))
    logout
  end

  def test_should_destroy_adsize
    login
    assert_difference('Adsize.count', -1) do
      delete :destroy, :id => adsizes(:half).id
    end

    assert_redirected_to adsizes_path
    logout
  end
end
