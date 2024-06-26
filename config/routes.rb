Rails.application.routes.draw do
  root to: 'public/posts#index'
  
  get 'about' => 'public/homes#about', as: 'about'
  
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index, :show, :destroy] do 
      member do
        get :post_comments 
      end
      collection do
      get :search
      end
    end 
    resources :post_comments, only: [:index, :destroy]
    resources :subject_categories, only: [:index, :create, :edit, :update, :destroy]
  end

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }, sign_out_via: [:get, :delete]

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  get '/users/:id/confirm_withdrawal' => 'public/users#confirm_withdrawal', as: 'confirm_withdrawal'
  patch '/users/:id/withdrawal' => 'public/users#withdrawal', as: 'withdrawal'
  resources :users, only: [:show, :edit, :update], controller: 'public/users' do
    member do
      get :my_favorites
    end
  end

  resources :posts, controller: 'public/posts' do
    resource :favorite, only: [:create, :destroy], controller: 'public/favorites'
    resources :post_comments, only: [:index, :create, :destroy], controller: 'public/post_comments'
    collection do
      get :search
    end
  end

 
  
  devise_scope :user do
    post "users/guest_sign_in", to: "public/sessions#guest_sign_in"
  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
