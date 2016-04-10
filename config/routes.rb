Rails.application.routes.draw do
  
  get 'episodes/new'

  devise_for :users
  
  resources :users, only: [:index, :show] do
    resources :episodes
  end
  
  authenticated :user do
    root 'users#dashboard', as: "authenticated_root"
  end
  
  root 'welcome#index'
  

end
