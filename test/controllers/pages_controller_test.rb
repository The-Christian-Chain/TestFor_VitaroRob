require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get about" do
    get pages_about_url
    assert_response :success
  end

  test "should get contact_us" do
    get pages_contact_us_url
    assert_response :success
  end

  test "should get social" do
    get pages_social_url
    assert_response :success
  end

  test "should get terms_of_use" do
    get pages_terms_of_use_url
    assert_response :success
  end

  test "should get privacy_policy" do
    get pages_privacy_policy_url
    assert_response :success
  end

  test "should get faq" do
    get pages_faq_url
    assert_response :success
  end

  test "should get media_kit" do
    get pages_media_kit_url
    assert_response :success
  end

  test "should get sitemap" do
    get pages_sitemap_url
    assert_response :success
  end

end
