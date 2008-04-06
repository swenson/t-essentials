require File.dirname(__FILE__) + '/../test_helper'

class ClientsControllerTest < ActionController::TestCase
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
    assert_not_nil assigns(:clients)
    logout
  end

  def test_should_get_new
    login
    get :new
    assert_response :success
    logout
  end

  def test_should_create_client
    login
    assert_difference('Client.count') do
      post :create, :client => { :business => 'bus' }
    end

    assert_redirected_to client_path(assigns(:client))
    logout
  end

  def test_should_not_create_client
    login
    count = Client.count
    post :create, :client => { }
    assert_equal count, Client.count
    logout
  end


  def test_should_show_client
    login
    get :show, :id => clients(:one).id
    assert_response :success
    logout
  end

  def test_should_get_edit
    login
    get :edit, :id => clients(:one).id
    assert_response :success
    logout
  end

  def test_should_update_client
    login
    put :update, :id => clients(:one).id, :client => { }
    assert_redirected_to client_path(assigns(:client))
    logout
  end

  def test_should_destroy_client
    login
    assert_difference('Client.count', -1) do
      delete :destroy, :id => clients(:one).id
    end

    assert_redirected_to clients_path
    logout
  end
end
