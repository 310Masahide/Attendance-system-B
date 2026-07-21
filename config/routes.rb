Rails.application.routes.draw do
  root 'static_pages#top'
  get '/signup', to: 'users#new'

  # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    collection do
      get 'basic_info'
      patch 'basic_info', action: :update_basic_info, as: :update_basic_info
    end
    member do
      get 'attendances/edit_one_month'
      patch 'attendances/update_one_month' # この行が追加対象です。
      get 'basic_info', action: :edit_basic_info, as: :edit_basic_info
      patch 'basic_info', action: :update_user_basic_info, as: :update_user_basic_info
    end
    resources :attendances, only: :update
  end
end