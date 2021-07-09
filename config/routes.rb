Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/campgrounds', to: 'campgrounds#index'
  get '/campgrounds/new', to: 'campgrounds#new'
  post '/campgrounds', to: 'campgrounds#create'
  get '/campgrounds/:id', to: 'campgrounds#show'
  get '/campgrounds/:id/campsites', to: 'campground_campsites#index'

  get '/campsites', to: 'campsites#index'
  get '/campsites/:id', to: 'campsites#show'

  get '/national_parks', to: 'national_parks#index'
  get '/national_parks/:id', to: "national_parks#show"
  get '/national_parks/:national_park_id/trails', to: "national_park_trails#index"
  get '/trails', to: 'trails#index'
  get '/trails/:id', to: 'trails#show'

end
