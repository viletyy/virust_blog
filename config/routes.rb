Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations',
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "admin/templates#index"
  namespace :admin do
    root "home#index"
    resources :templates, only: [:index] do
      collection do
        get :editor
      end
    end

    # 文章管理
    namespace :articles_manage do
      resources :articles do

      end

      resources :tags do

      end

      resources :categories do

      end

      resources :comments do

      end

      resources :view_records do

      end

      resources :like_records do

      end
    end

    # 用户管理
    namespace :users_manage do
      resources :users do

      end

      resources :roles do

      end

      resources :messages do

      end
    end

  end

end
