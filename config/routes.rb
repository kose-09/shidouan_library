Rails.application.routes.draw do
  root to: 'public/homes#about'

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }, sign_out_via: [:get, :delete]

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  get '/users/:id/confirm_withdrawal' => 'public/users#confirm_withdrawal', as: 'confirm_withdrawal'
  patch '/users/:id/withdrawal' => 'public/users#withdrawal', as: 'withdrawal'
  resources :users, only: [:show, :edit, :update], controller: 'public/users'

  resources :posts, controller: 'public/posts'

  resources :subject_categories, only: [:index, :create, :edit, :update], controller: 'admin/subject_categories'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
