require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:tony).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end
  test "should render 404 error page" do
    get :show, id: "doesn't exist"
    assert_response :not_found
  end
  test "that variables are assigned are assigned on successful profile viewing" do
    get :show, id: users(:tony).profile_name
    assert assigns(:user)
    assert_not_empty assigns(:listings)
  end
  
  test "only show a users listings" do
    get :show, id: users(:tony).profile_name
    assigns(:listings).each do |listing|
      assert_equal users(:tony), listing.user
      
    end
  end

end
