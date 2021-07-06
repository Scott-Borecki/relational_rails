Rails.application.routes.draw do
  get '/national_parks', to: 'national_parks#index'
  get '/national_parks/:id', to: "national_parks#show"
  get '/trails', to: 'trails#index'
  get '/trails/:id', to: 'trails#show'
end
