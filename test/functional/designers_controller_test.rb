require File.dirname(__FILE__) + '/../test_helper'

class DesignersControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:designers)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_designer
    assert_difference('Designer.count') do
      post :create, :designer => { }
    end

    assert_redirected_to designer_path(assigns(:designer))
  end

  def test_should_show_designer
    get :show, :id => designers(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => designers(:one).id
    assert_response :success
  end

  def test_should_update_designer
    put :update, :id => designers(:one).id, :designer => { }
    assert_redirected_to designer_path(assigns(:designer))
  end

  def test_should_destroy_designer
    assert_difference('Designer.count', -1) do
      delete :destroy, :id => designers(:one).id
    end

    assert_redirected_to designers_path
  end
end
