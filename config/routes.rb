JosipaistjepanVjencanje::Application.routes.draw do
  resources :photos, :only => [:create, :new, :destroy]
  get "admin" => "admin#photos"
  root :to => "home#index"
end
