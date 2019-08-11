Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "messages#index"
  resources :users, only: [:index, :edit, :update]
  resources :todos, only: [:index, :create, :destroy]
  resources :memos, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      get :all_destroy
    end
  end
  resources :themes, only: [:index, :new, :create, :edit, :update] do
    resources :posts, only: [:index, :create, :edit, :update]
  end
  resources :newsweeks, only: [:index, :new] do
    collection do
      get :search_title
      get :search_category
    end
  end
end

