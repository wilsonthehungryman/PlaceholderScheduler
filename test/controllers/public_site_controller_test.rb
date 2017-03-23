require 'test_helper'

class PublicSiteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_site_index_url
    assert_response :success
  end

  test "should get contact" do
    get public_site_contact_url
    assert_response :success
  end

  test "should get about" do
    get public_site_about_url
    assert_response :success
  end

  test "should get pricing" do
    get public_site_pricing_url
    assert_response :success
  end

  test "should get demo" do
    get public_site_demo_url
    assert_response :success
  end

end
