Loopbac::Application.routes.draw do
  match "/pages(/:action)", controller: "pages"
  resources :notes do
    collection do
      get 'about/me' => "notes#index", about: 'me', as: 'about_me'
      get 'about/others' => "notes#index", about: 'others', as: 'about_others'
    end
  end

  resources :simple_feedbacks do
    collection do
      get 'about/me' => "simple_feedbacks#index", about: 'me', as: 'about_me'
      get 'about/others' => "simple_feedbacks#index", about: 'others', as: 'about_others'
    end
  end

  resources :photos

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  root :to => 'welcome#index'
end
