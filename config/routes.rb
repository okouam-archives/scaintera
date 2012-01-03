Scaintera::Application.routes.draw do
  resource :user_sessions, :calculator
  resources :users, :policies, :policy_holders, :beneficiaries,:users
  match '/' => 'policies#index'
end
