Rails.application.routes.draw do
  Rails.application.routes.default_url_options[:host] = ENV['HOST_URL']

  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  devise_for :user, path: 'auth', controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :base, only: [:show]
  resources :events, only: [:index, :show], path: 'events' do
    resources :event_enquiries, only: [:new, :create], path: 'enquiries'
  end

  resources :hotels, only: [:index, :show], path: 'aparthotels' do
    resources :hotel_enquiries, only: [:new, :create]
  end
  resources :pages, only: [:show]

  resources :restaurants, only: [:index, :show], path: 'restaurants' do
    resources :restaurant_enquiries, only: [:new, :create], path: 'enquiries'
  end

  resources :users, only: [:show,:edit,:update]

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
