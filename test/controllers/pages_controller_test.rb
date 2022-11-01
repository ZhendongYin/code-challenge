# frozen_string_literal: true

require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @customer = customers(:jordan)
    @payment_request = payment_requests(:jordans_payment)
  end

  test "#main" do
    get root_path

    assert_response :success
  end

  test "#payment_request_list" do
    get "/pages/payment_request_list/#{@customer.id}"

    assert_response :success
  end

  test "#update" do
    put payment_request_path(@payment_request), params: {payment_request: {status: :collected}}, xhr: true
    @payment_request.reload

    assert_equal "collected", @payment_request.status
  end
end
