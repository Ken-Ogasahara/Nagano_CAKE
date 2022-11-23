Rails.application.routes.draw do

  get 'about' => "public/homes#about"
  get '/' => "public/homes#top"

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :public do
    root to: 'homes#top'
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :orders do
      collection do
        get 'confirm'
        get 'complete'
      end
    end
    resources :orders, only: [:index, :new, :create, :show]
    resources :cart_items do
      collection do
        delete 'destroy_all'
      end
    end
    resources :cart_items, only: [:index, :update, :destroy, :create]
    resources :customers do
      collection do
        get 'confirm'
        patch 'withdrawal'
      end
    end
    resources :customers, only: [:show, :edit, :update]
    resources :items, only: [:index, :show]

  end

  # namespace :public do
  #   get 'addresses/index'
  #   get 'addresses/edit'
  #   get 'addresses/create'
  #   get 'addresses/update'
  #   get 'addresses/destroy'
  # end
  # namespace :public do
    # get 'orders/new'
    # get 'orders/confirm'
    # get 'orders/complete'
    # get 'orders/create'
    # get 'orders/index'
    # get 'orders/show'
  # end
  # namespace :public do
  #   get 'cart_items/index'
  #   get 'cart_items/update'
  #   get 'cart_items/destory'
  #   get 'cart_items/destroy_all'
  #   get 'cart_items/create'
  # end
  # namespace :public do
  #   get 'customers/show'
  #   get 'customers/edit'
  #   get 'customers/update'
  #   get 'customers/confirm'
  #   get 'customers/withdrawal'
  # end
  # namespace :public do
  #   get 'items/index'
  #   get 'items/show'
  # end
  # namespace :public do
  #   get 'homes/top'
  # end
  # get 'home/about' => 'home#about', as: 'about'
  # application.html.erbも編集

  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  # devise_scope :admin do
  #   root "admin/sessions#new"
  # end

  namespace :admin do
    root to: 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  # namespace :admin do
  #   get 'items/index'
  #   get 'items/new'
  #   get 'items/create'
  #   get 'items/show'
  #   get 'items/edit'
  #   get 'items/update'
  # end
  # namespace :admin do
  #   get 'homes/top'
  # end
  # namespace :admin do
  #   get 'order_details/update'
  # end
  # namespace :admin do
  #   get 'orders/show'
  #   get 'orders/update'
  # end
  # namespace :admin do
  #   get 'customers/index'
  #   get 'customers/show'
  #   get 'customers/edit'
  #   get 'customers/update'
  # end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
