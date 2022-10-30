# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :load_customer, only: :payment_request_list
  before_action :load_payment_request, only: :update

  def main
    @customers = Customer.all
  end

  def payment_request_list
    @payment_requests = @customer&.payment_requests.order(:id)
    render partial: "pages/payment_requests"
  end


  def update
    respond_to do |format|
      if @payment_request.update(payment_request_params)
        @customer = @payment_request.customer
        @payment_requests = @customer&.payment_requests.order(:id)
        format.turbo_stream
      end
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
