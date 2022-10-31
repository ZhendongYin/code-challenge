# frozen_string_literal: true

require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "#main" do
    get root_path

    assert_response :success
  end

  test "#payment_request_list" do
    customer = Customer.first
    get "/pages/payment_request_list/#{customer.id}"

    assert_response :success
  end

  test "#update" do
    pr = PaymentRequest.generated.first
    put payment_request_path(pr), params: {payment_request: {status: :generated}}, xhr: true
    pr.reload
    assert_equal "generated", pr.status
  end
end
