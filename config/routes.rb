Scaintera::Application.routes.draw do
  resource :user_sessions, :calculator
  resources :policy_holders, :users, :beneficiaries
  resources :settings do
    collection do
      post "prices"
      post "reset"
    end
  end
  match '/' => 'policy_holders#index'
end
