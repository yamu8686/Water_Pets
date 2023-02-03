Rails.application.routes.draw do

  namespace :public do
    get 'creatures/index'
    get 'creatures/show'
    get 'creatures/edit'
  end
  namespace :admin do
    get 'genres/new'
    get 'genres/index'
    get 'genres/edit'
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
