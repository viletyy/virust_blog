Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations',
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  # 前台展示
  get 'article_detail/:id', to: 'home#article_detail', as: :article_detail_home
  get 'article_detail/:id/like_records', to: 'home#like_article', as: :like_article_home
  get 'article_detail/:id/comments', to: 'home#article_comments', as: :article_detail_comments_home
  post 'article_detail/:id/comments', to: 'home#article_comment'

  get 'news', to: 'home#news', as: :news_home
  get 'news_detail/:id', to: 'home#news_detail', as: :news_detail_home
  get 'news_detail/:id/comments', to: 'home#news_comments', as: :news_detail_comments_home
  post 'news_detail/:id/comments', to: 'home#news_comment'


  # 后台管理
  namespace :admin do
    root "home#index"
    resources :templates, only: [:index] do
      collection do
        get :editor
      end
    end

    # 资讯管理
    namespace :news_manage do
      resources :news do

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
