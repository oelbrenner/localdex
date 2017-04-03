require 'test_helper'

class EpostcardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @epostcard = epostcards(:one)
  end

  test "should get index" do
    get epostcards_url
    assert_response :success
  end

  test "should get new" do
    get new_epostcard_url
    assert_response :success
  end

  test "should create epostcard" do
    assert_difference('Epostcard.count') do
      post epostcards_url, params: { epostcard: { main_image: @epostcard.main_image, name: @epostcard.name, page_id: @epostcard.page_id } }
    end

    assert_redirected_to epostcard_url(Epostcard.last)
  end

  test "should show epostcard" do
    get epostcard_url(@epostcard)
    assert_response :success
  end

  test "should get edit" do
    get edit_epostcard_url(@epostcard)
    assert_response :success
  end

  test "should update epostcard" do
    patch epostcard_url(@epostcard), params: { epostcard: { main_image: @epostcard.main_image, name: @epostcard.name, page_id: @epostcard.page_id } }
    assert_redirected_to epostcard_url(@epostcard)
  end

  test "should destroy epostcard" do
    assert_difference('Epostcard.count', -1) do
      delete epostcard_url(@epostcard)
    end

    assert_redirected_to epostcards_url
  end
end
