require File.dirname(__FILE__) + '/../test_helper'

class SalespeopleControllerTest < ActionController::TestCase
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
    assert_not_nil assigns(:salespeople)
    logout
  end

  def test_should_get_new
    login
    get :new
    assert_response :success
    logout
  end

  def test_should_create_salesperson
    login
    assert_difference('Salesperson.count') do
      post :create, :salesperson => { }
    end

    assert_redirected_to salesperson_path(assigns(:salesperson))
    logout
  end

  def test_should_show_salesperson
    login
    get :show, :id => salespeople(:one).id
    assert_response :success
    logout
  end

  def test_should_get_edit
    login
    get :edit, :id => salespeople(:one).id
    assert_response :success
    logout
  end

  def test_should_update_salesperson
    login
    put :update, :id => salespeople(:one).id, :salesperson => { }
    assert_redirected_to salesperson_path(assigns(:salesperson))
    logout
  end

  def test_should_destroy_salesperson
    login
    assert_difference('Salesperson.count', -1) do
      delete :destroy, :id => salespeople(:one).id
    end

    assert_redirected_to salespeople_path
    logout
  end
end
