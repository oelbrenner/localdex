require 'test_helper'

class LodgingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lodging = lodgings(:one)
  end

  test "should get index" do
    get lodgings_url
    assert_response :success
  end

  test "should get new" do
    get new_lodging_url
    assert_response :success
  end

  test "should create lodging" do
    assert_difference('Lodging.count') do
      post lodgings_url, params: { lodging: { address_line_one: @lodging.address_line_one, address_line_two: @lodging.address_line_two, city: @lodging.city, company_name: @lodging.company_name, contact: @lodging.contact, customer_status_notes: @lodging.customer_status_notes, destination_ref: @lodging.destination_ref, details: @lodging.details, email: @lodging.email, expires_at: @lodging.expires_at, fax: @lodging.fax, mask2id_ref: @lodging.mask2id_ref, paid_at: @lodging.paid_at, phone: @lodging.phone, region_ref: @lodging.region_ref, reservation: @lodging.reservation, season: @lodging.season, state: @lodging.state, url: @lodging.url, user_id: @lodging.user_id, zip: @lodging.zip } }
    end

    assert_redirected_to lodging_url(Lodging.last)
  end

  test "should show lodging" do
    get lodging_url(@lodging)
    assert_response :success
  end

  test "should get edit" do
    get edit_lodging_url(@lodging)
    assert_response :success
  end

  test "should update lodging" do
    patch lodging_url(@lodging), params: { lodging: { address_line_one: @lodging.address_line_one, address_line_two: @lodging.address_line_two, city: @lodging.city, company_name: @lodging.company_name, contact: @lodging.contact, customer_status_notes: @lodging.customer_status_notes, destination_ref: @lodging.destination_ref, details: @lodging.details, email: @lodging.email, expires_at: @lodging.expires_at, fax: @lodging.fax, mask2id_ref: @lodging.mask2id_ref, paid_at: @lodging.paid_at, phone: @lodging.phone, region_ref: @lodging.region_ref, reservation: @lodging.reservation, season: @lodging.season, state: @lodging.state, url: @lodging.url, user_id: @lodging.user_id, zip: @lodging.zip } }
    assert_redirected_to lodging_url(@lodging)
  end

  test "should destroy lodging" do
    assert_difference('Lodging.count', -1) do
      delete lodging_url(@lodging)
    end

    assert_redirected_to lodgings_url
  end
end
