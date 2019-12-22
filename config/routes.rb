Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  scope "(:locale)", locale: /en|vi/ do

    resources :chairs
    resource :cart, only: [:show]
    resources :order_items, only: [:create, :update, :destroy]

    get 'admin/dashboard'

    get 'chart', to: 'admin#show_chart'

    root "static_pages#home"
     #contact
    get 'contact', to: 'static_pages#contact'
    #resources users
    resources :users,  only: [:index, :edit, :update]

    resources :billings, only: [:new, :create, :index, :show, :delete]
    namespace :admin do
      resources :users
      resources :chairs
      resources :categories
      resources :billings, only: [:index, :show]
      resources :brands
    end
    
    #rating
    post 'rating', to: 'chairs#rating'
    get 'rating', to: 'chairs#get_rating'
    #autocomplete search
    post 'search_chair', to: 'chairs#get_chair_by_key'
   
  end
end
