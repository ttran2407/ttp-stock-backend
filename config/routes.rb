Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :transactions
    resources :watchlists
    resources :holdings
  end 

  resources :stocks, only: [:index, :show]

end
