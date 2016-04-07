Rails.application.routes.draw do
  
  get 'episodes/new'

  devise_for :users
  root 'welcome#index'
  
  resources :users, only: [:index, :show] do
    resources :episodes
  end

end
