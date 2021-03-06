Rails.application.routes.draw do


  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'homes_about'
  resources :users, only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end



  resources :groups, only: [:new, :create, :edit, :update, :index, :show] do
    get "new/mail" => "groups#new_mail"
    get "send/mail" => "groups#send_mail"
    member do
      post :join
      delete :leave
    end

  end

  get 'search' => "search#search"

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end


end