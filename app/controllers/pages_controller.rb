# frozen_string_literal: true

class PagesController < ApplicationController
  def main
    @customers = Customer.all
  end

  def payment_request_list
  end

  def update
  end
end
