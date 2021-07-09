Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/campgrounds', to: 'campgrounds#index'
  get '/campgrounds/:id', to: 'campgrounds#show'
  get '/campgrounds/:id/campsites', to: 'campgrounds#index_campsites'

  get '/campsites', to: 'campsites#index'
  get '/campsites/:id', to: 'campsites#show'

  get '/national_parks', to: 'national_parks#index'
  get '/national_parks/new', to: 'national_parks#new'
  post '/national_parks', to: 'national_parks#create'
  get '/national_parks/:id', to: "national_parks#show"
  get '/national_parks/:id/edit', to: 'national_parks#edit'
  post '/national_parks/:id', to: 'national_parks#update'

  get '/national_parks/:national_park_id/trails', to: "national_park_trails#index"

  get '/trails', to: 'trails#index'
  get '/trails/:id', to: 'trails#show'
end
