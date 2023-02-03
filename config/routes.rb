Rails.application.routes.draw do

  namespace :public do
    resources :creatures, only: [:index, :show, :edit, :create, :update]
  end
  namespace :admin do
    resources :genres, only: [:new, :index, :edit, :create, :update]
  end
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
    root "homes#top"
    get "/about" => "homes#about"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
