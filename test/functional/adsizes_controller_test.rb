require File.dirname(__FILE__) + '/../test_helper'

class AdsizesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:adsizes)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_adsize
    assert_difference('Adsize.count') do
      post :create, :adsize => { }
    end

    assert_redirected_to adsize_path(assigns(:adsize))
  end

  def test_should_show_adsize
    get :show, :id => adsizes(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => adsizes(:one).id
    assert_response :success
  end

  def test_should_update_adsize
    put :update, :id => adsizes(:one).id, :adsize => { }
    assert_redirected_to adsize_path(assigns(:adsize))
  end

  def test_should_destroy_adsize
    assert_difference('Adsize.count', -1) do
      delete :destroy, :id => adsizes(:one).id
    end

    assert_redirected_to adsizes_path
  end
end
