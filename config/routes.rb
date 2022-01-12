Rails.application.routes.draw do

  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #管理者側
  namespace :admin do
    root to: 'homes#top'
    resources :customers, only[:index]
    resources :posts, only[:index, :show, :edit, :update]
    resources :event_podts, only[:edit, :update, :index]
    resources :responses, only[:index, :new, :create]
  end

  #顧客側
  scope module: :customer do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :customers, only[:show, :update] do
      get 'unsubscribe' => 'customers#unsubscribe'
      patch 'withdraw' => 'customers#withdraw'
    end
    resources :posts, except[:destroy, :edit, :update]
    get 'posts/thanks' => 'posts#thanks'
    resources :event_posts, only[:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
