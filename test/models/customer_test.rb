# frozen_string_literal: true

require "test_helper"

class CustomerTest < ActiveSupport::TestCase
  def setup
    @customer = customers(:jordan)
  end

  test "first_name should be present" do
    @customer.first_name = nil

    assert_not @customer.valid?
    assert_includes @customer.errors.messages[:first_name], "can't be blank"
  end

  test "last_name should be present" do
    @customer.last_name = nil

    assert_not @customer.valid?
    assert_includes @customer.errors.messages[:last_name], "can't be blank"
  end

  test "generated_payment_requests_num" do
    assert_equal 1, @customer.generated_payment_requests_num
  end
end
