require 'test_helper'

class TweetControllerTest < ActionDispatch::IntegrationTest
  test "should get auth" do
    get tweet_auth_url
    assert_response :success
  end

  test "should get callback" do
    get tweet_callback_url
    assert_response :success
  end

  test "should get tweet" do
    get tweet_tweet_url
    assert_response :success
  end

end
