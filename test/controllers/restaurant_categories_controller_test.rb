require 'test_helper'

class RestaurantCategoriesControllerTest < ActionController::TestCase
  setup do
    @restaurant_category = restaurant_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurant_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create restaurant_category" do
    assert_difference('RestaurantCategory.count') do
      post :create, restaurant_category: { category_id: @restaurant_category.category_id, restaurant_id: @restaurant_category.restaurant_id }
    end

    assert_redirected_to restaurant_category_path(assigns(:restaurant_category))
  end

  test "should show restaurant_category" do
    get :show, id: @restaurant_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @restaurant_category
    assert_response :success
  end

  test "should update restaurant_category" do
    patch :update, id: @restaurant_category, restaurant_category: { category_id: @restaurant_category.category_id, restaurant_id: @restaurant_category.restaurant_id }
    assert_redirected_to restaurant_category_path(assigns(:restaurant_category))
  end

  test "should destroy restaurant_category" do
    assert_difference('RestaurantCategory.count', -1) do
      delete :destroy, id: @restaurant_category
    end

    assert_redirected_to restaurant_categories_path
  end
end
