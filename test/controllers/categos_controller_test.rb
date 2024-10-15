require "test_helper"

class CategosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @catego = categos(:one)
  end

  test "should get index" do
    get categos_url
    assert_response :success
  end

  test "should get new" do
    get new_catego_url
    assert_response :success
  end

  test "should create catego" do
    assert_difference("Catego.count") do
      post categos_url, params: { catego: { name: @catego.name } }
    end

    assert_redirected_to catego_url(Catego.last)
  end

  test "should show catego" do
    get catego_url(@catego)
    assert_response :success
  end

  test "should get edit" do
    get edit_catego_url(@catego)
    assert_response :success
  end

  test "should update catego" do
    patch catego_url(@catego), params: { catego: { name: @catego.name } }
    assert_redirected_to catego_url(@catego)
  end

  test "should destroy catego" do
    assert_difference("Catego.count", -1) do
      delete catego_url(@catego)
    end

    assert_redirected_to categos_url
  end
end
