# frozen_string_literal: true

Rails.application.routes.draw do
  root "pages#main"

  scope :pages do
    resources :payment_requests, only: :update, controller: "pages"
    get "payment_request_list/:customer_id", to: "pages#payment_request_list"
  end
end
