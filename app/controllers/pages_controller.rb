# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :load_customer, only: :payment_request_list
  before_action :load_payment_request, only: :update

  def main
    @customers = Customer.all
  end

  def payment_request_list
    @payment_requests = @customer&.payment_requests.order(:id)
  end


  def update
    if @payment_request.update(payment_request_params)
      # update
    end
  end

  private

  def load_customer
    @customer = Customer.find_by(id: params[:customer_id])
  end

  def load_payment_request
    @payment_request = PaymentRequest.find_by(id: params[:id])
  end

  def payment_request_params
    params.require(:payment_request).permit(:status)
  end
end
