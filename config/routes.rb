Loopbac::Application.routes.draw do
  match "/pages(/:action)", controller: "pages"
  resources :notes
  resources :feedback
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  root :to => 'welcome#index'
end
