Rails.application.routes.draw do
  get '/resumes/index', to: 'resumes#index'

  get '/resumes/show/:id', to: 'resumes#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
