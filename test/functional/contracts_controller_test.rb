require File.dirname(__FILE__) + '/../test_helper'

class ContractsControllerTest < ActionController::TestCase
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
    assert_not_nil assigns(:contracts)
    logout
  end

  def test_should_get_new
    login
    get :new
    assert_response :success
    logout
  end

  def test_should_create_contract
    login
    assert_difference('Contract.count') do
      post :create, :contract => { }
    end

    assert_redirected_to contract_path(assigns(:contract))
    logout
  end

  def test_should_show_contract
    login
    get :show, :id => contracts(:one).id
    assert_response :success
    logout
  end

  def test_should_get_edit
    login
    get :edit, :id => contracts(:one).id
    assert_response :success
    logout
  end

  def test_should_update_contract
    login
    put :update, :id => contracts(:one).id, :contract => { }
    assert_redirected_to contract_path(assigns(:contract))
    logout
  end

  def test_should_destroy_contract
    login
    assert_difference('Contract.count', -1) do
      delete :destroy, :id => contracts(:one).id
    end

    assert_redirected_to contracts_path
    logout
  end
end
