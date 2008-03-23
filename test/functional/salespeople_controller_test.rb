require File.dirname(__FILE__) + '/../test_helper'

class SalespeopleControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:salespeople)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_salesperson
    assert_difference('Salesperson.count') do
      post :create, :salesperson => { }
    end

    assert_redirected_to salesperson_path(assigns(:salesperson))
  end

  def test_should_show_salesperson
    get :show, :id => salespeople(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => salespeople(:one).id
    assert_response :success
  end

  def test_should_update_salesperson
    put :update, :id => salespeople(:one).id, :salesperson => { }
    assert_redirected_to salesperson_path(assigns(:salesperson))
  end

  def test_should_destroy_salesperson
    assert_difference('Salesperson.count', -1) do
      delete :destroy, :id => salespeople(:one).id
    end

    assert_redirected_to salespeople_path
  end
end
