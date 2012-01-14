Scaintera::Application.routes.draw do
  resource :user_sessions, :calculator
  match 'policies/:id/comments' => 'policies#comments', :via => :get

  resources :policies do
    resources :comments
  end

  resources :policy_holders

  resources :insurance_products

  resources :users, :beneficiaries

  match 'policies/:id/beneficiaries' => 'policies#beneficiaries', :via => :get, :as => :policy_beneficiaries
  match 'policies/:id/policy_holder' => 'policies#policy_holder', :via => :get, :as => :policy_holder
  match '/' => 'policies#index'
end
