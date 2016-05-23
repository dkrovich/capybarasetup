Testdriven::Application.routes.draw do

  resources :items

  get "welcome/index"
  root 'welcome#index'
end
