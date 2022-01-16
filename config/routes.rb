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
    resources :posts, only: [:index, :show, :edit, :update] do
      resources :responses, only: [:index, :new, :create]
    end
    resources :event_posts, only: [:edit, :update, :index]
  end

  #顧客側
  scope module: :customer do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :customers, only: [:edit, :update]
      get 'unsubscribe' => 'customers#unsubscribe'
      patch 'withdraw' => 'customers#withdraw'
    resources :posts, except: [:destroy, :edit, :update]do
      collection do
        get 'thanks'
      end
    end
    resources :event_posts, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
