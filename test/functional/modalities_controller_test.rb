require File.dirname(__FILE__) + '/../test_helper'

class ModalitiesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:modalities)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_modality
    assert_difference('Modality.count') do
      post :create, :modality => { }
    end

    assert_redirected_to modality_path(assigns(:modality))
  end

  def test_should_show_modality
    get :show, :id => modalities(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => modalities(:one).id
    assert_response :success
  end

  def test_should_update_modality
    put :update, :id => modalities(:one).id, :modality => { }
    assert_redirected_to modality_path(assigns(:modality))
  end

  def test_should_destroy_modality
    assert_difference('Modality.count', -1) do
      delete :destroy, :id => modalities(:one).id
    end

    assert_redirected_to modalities_path
  end
end
