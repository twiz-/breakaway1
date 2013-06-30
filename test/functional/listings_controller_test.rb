require 'test_helper'

class ListingsControllerTest < ActionController::TestCase
  setup do
    @listing = listings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:listings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create listing" do
    sign_in users(:tony)
    
    assert_difference('Listing.count') do
      post :create, listing: { description: @listing.description, video: @listing.video }
    end

    assert_redirected_to listing_path(assigns(:listing))
  end
  
  test "should create listing for the current user when logged in" do
    sign_in users(:tony)
    
    assert_difference('Listing.count') do
      post :create, listing: { description: @listing.description, video: @listing.video, user_id: users(:reggie).id }
      
    end

    assert_redirected_to listing_path(assigns(:listing))
    assert_equal assigns(:listing).user_id, users(:tony).id
  end

  test "should show listing" do
    get :show, id: @listing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @listing
    assert_response :success
  end

  test "should update listing" do
    sign_in users(:tony)
    
    put :update, id: @listing, listing: { description: @listing.description, video: @listing.video }
    assert_redirected_to listing_path(assigns(:listing))
  end
  
  test "should update listing only as current user" do
    sign_in users(:tony)
    
    put :update, id: @listing, listing: { description: @listing.description, video: @listing.video, user_id: users(:reggie).id }
    assert_redirected_to listing_path(assigns(:listing))
    
    assert_equal assigns(:listing).user_id, users(:tony).id
  end
  test "should not update listing only if nothing is sent in" do
    sign_in users(:tony)
    
    put :update, id: @listing
    assert_redirected_to listing_path(assigns(:listing))
    
    assert_equal assigns(:listing).user_id, users(:tony).id
  end

  test "should destroy listing" do
    assert_difference('Listing.count', -1) do
      delete :destroy, id: @listing
    end

    assert_redirected_to listings_path
  end
end
