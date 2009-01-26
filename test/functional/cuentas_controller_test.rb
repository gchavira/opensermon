require File.dirname(__FILE__) + '/../test_helper'

class CuentasControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:cuentas)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_cuenta
    assert_difference('Cuenta.count') do
      post :create, :cuenta => { }
    end

    assert_redirected_to cuenta_path(assigns(:cuenta))
  end

  def test_should_show_cuenta
    get :show, :id => cuentas(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => cuentas(:one).id
    assert_response :success
  end

  def test_should_update_cuenta
    put :update, :id => cuentas(:one).id, :cuenta => { }
    assert_redirected_to cuenta_path(assigns(:cuenta))
  end

  def test_should_destroy_cuenta
    assert_difference('Cuenta.count', -1) do
      delete :destroy, :id => cuentas(:one).id
    end

    assert_redirected_to cuentas_path
  end
end
