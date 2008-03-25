require File.dirname(__FILE__) + '/../test_helper'

class ChargesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:charges)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_charge
    assert_difference('Charge.count') do
      post :create, :charge => { }
    end

    assert_redirected_to charge_path(assigns(:charge))
  end

  def test_should_show_charge
    get :show, :id => charges(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => charges(:one).id
    assert_response :success
  end

  def test_should_update_charge
    put :update, :id => charges(:one).id, :charge => { }
    assert_redirected_to charge_path(assigns(:charge))
  end

  def test_should_destroy_charge
    assert_difference('Charge.count', -1) do
      delete :destroy, :id => charges(:one).id
    end

    assert_redirected_to charges_path
  end
end
