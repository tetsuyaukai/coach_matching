require 'test_helper'

class UsersSportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_sport = users_sports(:one)
  end

  test "should get index" do
    get users_sports_url
    assert_response :success
  end

  test "should get new" do
    get new_users_sport_url
    assert_response :success
  end

  test "should create users_sport" do
    assert_difference('UsersSport.count') do
      post users_sports_url, params: { users_sport: {  } }
    end

    assert_redirected_to users_sport_url(UsersSport.last)
  end

  test "should show users_sport" do
    get users_sport_url(@users_sport)
    assert_response :success
  end

  test "should get edit" do
    get edit_users_sport_url(@users_sport)
    assert_response :success
  end

  test "should update users_sport" do
    patch users_sport_url(@users_sport), params: { users_sport: {  } }
    assert_redirected_to users_sport_url(@users_sport)
  end

  test "should destroy users_sport" do
    assert_difference('UsersSport.count', -1) do
      delete users_sport_url(@users_sport)
    end

    assert_redirected_to users_sports_url
  end
end
