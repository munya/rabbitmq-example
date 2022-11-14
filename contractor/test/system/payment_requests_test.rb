require "application_system_test_case"

class PaymentRequestsTest < ApplicationSystemTestCase
  setup do
    @payment_request = payment_requests(:one)
  end

  test "visiting the index" do
    visit payment_requests_url
    assert_selector "h1", text: "Payment requests"
  end

  test "should create payment request" do
    visit payment_requests_url
    click_on "New payment request"

    fill_in "Amount", with: @payment_request.amount
    fill_in "Currency", with: @payment_request.currency
    fill_in "Description", with: @payment_request.description
    fill_in "Status", with: @payment_request.status
    click_on "Create Payment request"

    assert_text "Payment request was successfully created"
    click_on "Back"
  end

  test "should update Payment request" do
    visit payment_request_url(@payment_request)
    click_on "Edit this payment request", match: :first

    fill_in "Amount", with: @payment_request.amount
    fill_in "Currency", with: @payment_request.currency
    fill_in "Description", with: @payment_request.description
    fill_in "Status", with: @payment_request.status
    click_on "Update Payment request"

    assert_text "Payment request was successfully updated"
    click_on "Back"
  end

  test "should destroy Payment request" do
    visit payment_request_url(@payment_request)
    click_on "Destroy this payment request", match: :first

    assert_text "Payment request was successfully destroyed"
  end
end
