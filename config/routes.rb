Loopbac::Application.routes.draw do
  constraints(:subdomain => 'app') do
    resources :feedback
    resources :meta_feedback
    resources :rankings do
      post 'sort', on: :collection
    end

    namespace :admin do
      get 'settings/edit', to: redirect('/admin/managerships/new')
      resources :managerships, only: [:new, :create, :index, :destroy]
    end
    match "/auth/:provider/callback" => "sessions#create"
    match "/signout" => "sessions#destroy", :as => :signout
    root :to => 'dashboard#show'
  end

  resource :support, only: [:show]
  resource :terms_of_service, only: [:show]
  root :to => 'home#show'
end
