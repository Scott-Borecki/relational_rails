Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/campgrounds', to: 'campgrounds#index'
  get '/campgrounds/new', to: 'campgrounds#new'
  post '/campgrounds', to: 'campgrounds#create'
  get '/campgrounds/:id', to: 'campgrounds#show'
  get '/campgrounds/:id/edit', to: 'campgrounds#edit'
  patch '/campgrounds/:id', to: 'campgrounds#update'
  delete '/campgrounds/:id', to: 'campgrounds#destroy'
  
  get '/campgrounds/:id/campsites', to: 'campground_campsites#index'
  get '/campgrounds/:id/campsites/new', to: 'campsites#new'
  post '/campgrounds/:id/campsites', to: 'campsites#create'

  get '/campsites', to: 'campsites#index'
  get '/campsites/:id/edit', to: 'campsites#edit'
  patch '/campsites/:id', to: 'campsites#update'
  get '/campsites/:id', to: 'campsites#show'
  delete 'campsites/:id', to: 'campsites#destroy'

  get '/national_parks', to: 'national_parks#index'
  get '/national_parks/new', to: 'national_parks#new'
  post '/national_parks', to: 'national_parks#create'
  get '/national_parks/:id', to: "national_parks#show"
  get '/national_parks/:id/edit', to: 'national_parks#edit'
  post '/national_parks/:id', to: 'national_parks#update'
  delete '/national_parks/:id', to: 'national_parks#destroy'

  get '/national_parks/:national_park_id/trails', to: "national_park_trails#index"
  get '/national_parks/:national_park_id/trails/new', to: "national_park_trails#new"
  post '/national_parks/:national_park_id/trails', to: 'national_park_trails#create'

  get '/trails', to: 'trails#index'
  get '/trails/:id', to: 'trails#show'
  get '/trails/:id/edit', to: 'trails#edit'
  post '/trails/:id', to: 'trails#update'
  delete 'trails/:id', to: 'trails#destroy'
end
