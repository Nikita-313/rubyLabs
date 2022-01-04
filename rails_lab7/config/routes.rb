Rails.application.routes.draw do
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #
  resources :lab_reports, only: %i[index new edit create update destroy]
  # get '/', to: 'lab_reports#index'
  # get '/new', to: 'lab_reports#new'
  # post '/new', to: 'lab_reports#create'
  # get '/:id/add_mark', to: 'lab_reports#add_mark'
  # post '/:id/add_mark', to: 'lab_reports#update_mark'
  # delete '/delete/:id', to: 'lab_reports#delete'
end
