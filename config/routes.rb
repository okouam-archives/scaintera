Scaintera::Application.routes.draw do
  resource :user_sessions, :calculator
  match 'policies/:id/beneficiaries' => 'policies#beneficiaries', :via => :get, :as => :policy_beneficiaries
  match 'policies/:id/comments' => 'policies#comments', :via => :get, :as => :policy_comments
  match 'policies/:id/policy_holder' => 'policies#policy_holder', :via => :get, :as => :policy_holder
  resources :users, :policies, :policy_holders, :beneficiaries,:users
  match '/' => 'policies#index'
end
