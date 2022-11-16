Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'markdown_parser#index'

  post '/parse', to: 'markdown_parser#parse'
end
