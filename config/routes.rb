Rails.application.routes.draw do
  root 'application#index'
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  authenticate :admin do
    resources :admins, only: [:index]
    scope :admins do
      resources :real_estate, only: [:new, :create, :edit, :update, :destroy]
    end
  end
  get 'real_estate/index', to: 'real_estate#index', as: :list_real_estate
  get 'real_estate/:id', to: 'real_estate#show', as: :show_real_estate
end
