Rails.application.routes.draw do

  devise_for :songs

  resources :songs, only: [:index, :show] do
    resources :noises
  end

  authenticated :song do
    root 'songs#dashboard', as: 'authenticated_root'
  end

  root 'pages#welcome'
end
