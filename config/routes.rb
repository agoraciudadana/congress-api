CongressApi::Application.routes.draw do
  resources :proposals, :only => [:index, :show]
  root :to => 'proposals#index'
end
