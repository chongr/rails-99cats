Rails.application.routes.draw do
  resources :cats
  resources :cat_rental_requests, only: [:new, :create, :show]
  patch "/cat_rental_requests/:id" => "cat_rental_requests#update"
  put "/cat_rental_requests/:id" => "cat_rental_requests#deny"
end
