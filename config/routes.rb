Rails.application.routes.draw do

  devise_for :songs
  root 'pages#welcome'

end
