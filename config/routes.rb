Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: 'customer/registrations',
    sessions: 'customer/sessions'
  }

  #管理者側

  namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index]
    resources :posts, only: [:index, :show, :edit, :update]
    resources :event_posts, only: [:edit, :update, :index]
    resources :responses, only: [:index, :new, :create]
  end

  #顧客側
  scope module: :customer do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :customers, only: [:show, :update]
      get 'unsubscribe' => 'customers#unsubscribe'
      patch 'withdraw' => 'customers#withdraw'
    resources :posts, except: [:destroy, :edit, :update]
    get 'posts/thanks' => 'posts#thanks'
    resources :event_posts, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
