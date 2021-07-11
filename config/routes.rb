Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/campgrounds', to: 'campgrounds#index'
  get '/campgrounds/new', to: 'campgrounds#new'
  post '/campgrounds', to: 'campgrounds#create'
  get '/campgrounds/:id', to: 'campgrounds#show'
  get '/campgrounds/:id/edit', to: 'campgrounds#edit'
  patch '/campgrounds/:id', to: 'campgrounds#update'
  delete '/campgrounds/:id', to: 'campgrounds#destroy'

  get '/campgrounds/:id/campsites/new', to: 'campsites#new'
  post '/campgrounds/:id/campsites', to: 'campsites#create'
  get '/campgrounds/:id/campsites', to: 'campground_campsites#index'
  get '/campsites', to: 'campsites#index'
  get '/campsites/:id/edit', to: 'campsites#edit'
  patch '/campsites/:id', to: 'campsites#update'
  get '/campsites/:id', to: 'campsites#show'
  delete 'campsites/:id', to: 'campsites#destroy'

  get '/national_parks', to: 'national_parks#index'
  get '/national_parks/:id', to: "national_parks#show"
  get '/national_parks/:national_park_id/trails', to: "national_park_trails#index"
  get '/trails', to: 'trails#index'
  get '/trails/:id', to: 'trails#show'

end
