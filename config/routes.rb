Wizards::Application.routes.draw do
  resources :wizards
  root :to => "wizards#index"
end
