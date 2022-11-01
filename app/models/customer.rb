# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :payment_requests, -> { order( id: :asc ) }, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  # get number of generated payment requests
  def generated_payment_requests_num
    payment_requests.generated.count
  end
end
