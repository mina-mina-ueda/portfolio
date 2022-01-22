Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/adminxxx', as: 'rails_admin'
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
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
    resources :posts, only: [:index, :show, :edit, :update, :destroy] do
      resources :responses, except: [:index]
    end
    get 'responses/index', to: 'responses#index'
    resources :events, only: [:index, :new, :create, :edit, :update] do
      resources :event_posts, only: [:index]
    end
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
    resources :events, only: [:show] do
      resources :event_posts, only: [:new, :create]
    end
  end

  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end