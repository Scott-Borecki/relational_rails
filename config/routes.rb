Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/campgrounds', to: 'campgrounds#index'
  get '/campgrounds/:id', to: 'campgrounds#show'
  get '/campgrounds/:id/campsites', to: 'campgrounds#index_campsites'
  get '/campsites', to: 'campsites#index'
  get '/campsites/:id', to: 'campsites#show'
end
