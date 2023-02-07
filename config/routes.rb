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
    resources :users, only: [:index, :show, :edit, :create, :update]
    resources :creatures, only: [:index, :show, :edit, :create, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
    end

  end

  namespace :admin do
    resources :genres, only: [:new, :index, :edit, :create, :update]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
