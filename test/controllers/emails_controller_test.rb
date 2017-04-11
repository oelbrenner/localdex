require 'test_helper'

class EmailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @email = emails(:one)
  end

  test "should get index" do
    get emails_url
    assert_response :success
  end

  test "should get new" do
    get new_email_url
    assert_response :success
  end

  test "should create email" do
    assert_difference('Email.count') do
      post emails_url, params: { email: { attempt_count: @email.attempt_count, epostcard_id: @email.epostcard_id, failed_at: @email.failed_at, from_email: @email.from_email, from_name: @email.from_name, lodging_id: @email.lodging_id, message: @email.message, sent_at: @email.sent_at, to_email: @email.to_email, to_name: @email.to_name } }
    end

    assert_redirected_to email_url(Email.last)
  end

  test "should show email" do
    get email_url(@email)
    assert_response :success
  end

  test "should get edit" do
    get edit_email_url(@email)
    assert_response :success
  end

  test "should update email" do
    patch email_url(@email), params: { email: { attempt_count: @email.attempt_count, epostcard_id: @email.epostcard_id, failed_at: @email.failed_at, from_email: @email.from_email, from_name: @email.from_name, lodging_id: @email.lodging_id, message: @email.message, sent_at: @email.sent_at, to_email: @email.to_email, to_name: @email.to_name } }
    assert_redirected_to email_url(@email)
  end

  test "should destroy email" do
    assert_difference('Email.count', -1) do
      delete email_url(@email)
    end

    assert_redirected_to emails_url
  end
end
