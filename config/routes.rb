Rails.application.routes.draw do

  root to: "homes#top"
  get "/about" => "homes#about",as: "about"
   # 管理者用
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # 顧客用
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  namespace :public do
    resources :users, only: [:index, :show, :edit, :create, :update]do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

    resources :creatures, only: [:index, :show, :edit, :create, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
    end
  end

  namespace :admin do
    resources :genres, only: [:new, :index, :edit, :create, :update]
  end
  namespace :admin do
    get 'creatures/index'
    get 'creatures/show'
    get 'creatures/edit'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
