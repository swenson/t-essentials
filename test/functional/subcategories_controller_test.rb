require File.dirname(__FILE__) + '/../test_helper'

class SubcategoriesControllerTest < ActionController::TestCase
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
    assert_not_nil assigns(:subcategories)
    logout
  end

  def test_should_get_new
    login
    get :new
    assert_response :success
    logout
  end

  def test_should_create_subcategory
    login
    assert_difference('Subcategory.count') do
      post :create, :subcategory => { :category_id => 1 }
    end

    assert_redirected_to subcategory_path(assigns(:subcategory))
    logout
  end

  def test_should_not_create_subcategory
    login
    count = Subcategory.count
    post :create, :subcategory => { }
    assert_equal count, Subcategory.count
 
    logout
  end


  def test_should_show_subcategory
    login
    get :show, :id => subcategories(:superfun).id
    assert_response :success
    logout
  end

  def test_should_get_edit
    login
    get :edit, :id => subcategories(:superfun).id
    assert_response :success
    logout
  end

  def test_should_update_subcategory
    login
    put :update, :id => subcategories(:superfun).id, :subcategory => { }
    assert_redirected_to subcategory_path(assigns(:subcategory))
    logout
  end

  def test_should_destroy_subcategory
    login
    assert_difference('Subcategory.count', -1) do
      delete :destroy, :id => subcategories(:superfun).id
    end

    assert_redirected_to subcategories_path
    logout
  end
end
