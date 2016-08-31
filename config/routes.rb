Rails.application.routes.draw do

  devise_for :songs
  root 'pages#welcome'

  resources :songs, only: [:index, :show] do
    resources :noises
  end
end
