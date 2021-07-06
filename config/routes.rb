Rails.application.routes.draw do
  get '/national_parks', to: 'national_parks#index'
end
