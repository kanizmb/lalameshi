require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post :create, restaurant: { address: @restaurant.address, budget: @restaurant.budget, distance: @restaurant.distance, geocode: @restaurant.geocode, holiday: @restaurant.holiday, image: @restaurant.image, restaurant_name: @restaurant.restaurant_name, tabelog_id: @restaurant.tabelog_id, tabelog_score: @restaurant.tabelog_score, tel: @restaurant.tel, time_required: @restaurant.time_required }
    end

    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should show restaurant" do
    get :show, id: @restaurant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @restaurant
    assert_response :success
  end

  test "should update restaurant" do
    patch :update, id: @restaurant, restaurant: { address: @restaurant.address, budget: @restaurant.budget, distance: @restaurant.distance, geocode: @restaurant.geocode, holiday: @restaurant.holiday, image: @restaurant.image, restaurant_name: @restaurant.restaurant_name, tabelog_id: @restaurant.tabelog_id, tabelog_score: @restaurant.tabelog_score, tel: @restaurant.tel, time_required: @restaurant.time_required }
    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete :destroy, id: @restaurant
    end

    assert_redirected_to restaurants_path
  end
end
