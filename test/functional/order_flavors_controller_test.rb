require 'test_helper'

class OrderFlavorsControllerTest < ActionController::TestCase
  setup do
    @order_flavor = order_flavors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_flavors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_flavor" do
    assert_difference('OrderFlavor.count') do
      post :create, :order_flavor => @order_flavor.attributes
    end

    assert_redirected_to order_flavor_path(assigns(:order_flavor))
  end

  test "should show order_flavor" do
    get :show, :id => @order_flavor.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @order_flavor.to_param
    assert_response :success
  end

  test "should update order_flavor" do
    put :update, :id => @order_flavor.to_param, :order_flavor => @order_flavor.attributes
    assert_redirected_to order_flavor_path(assigns(:order_flavor))
  end

  test "should destroy order_flavor" do
    assert_difference('OrderFlavor.count', -1) do
      delete :destroy, :id => @order_flavor.to_param
    end

    assert_redirected_to order_flavors_path
  end
end
