Scaintera::Application.routes.draw do
  resource :user_sessions, :calculator
  resources :policy_holders, :users, :beneficiaries
  match '/' => 'policy_holders#index'
end
