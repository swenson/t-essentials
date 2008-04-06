require File.dirname(__FILE__) + '/../test_helper'

class CategoriesControllerTest < ActionController::TestCase
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
    assert_not_nil assigns(:categories)
    logout
  end

  def test_should_get_new
    login
    get :new
    assert_response :success
    logout
  end

  def test_should_create_category
    login
    assert_difference('Category.count') do
      post :create, :category => { }
    end

    assert_redirected_to category_path(assigns(:category))
    logout
  end

  def test_should_show_category
    login
    get :show, :id => categories(:health).id
    assert_response :success
    logout
  end

  def test_should_get_edit
    login
    get :edit, :id => categories(:health).id
    assert_response :success
    logout
  end

  def test_should_update_category
    login
    put :update, :id => categories(:health).id, :category => { }
    assert_redirected_to category_path(assigns(:category))
    logout
  end

  def test_should_destroy_category
    login
    assert_difference('Category.count', -1) do
      delete :destroy, :id => categories(:health).id
    end

    assert_redirected_to categories_path
    logout
  end
end
