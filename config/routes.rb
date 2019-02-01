Rails.application.routes.draw do
  get '/followeds/:spotify_token', to: 'followeds#index'  
end
