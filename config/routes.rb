JosipaistjepanVjencanje::Application.routes.draw do
  resources :photos, :only => [:create, :new]
  root :to => "home#index"
end
