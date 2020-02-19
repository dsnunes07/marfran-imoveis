Rails.application.routes.draw do
  get 'search/index'
  root 'application#index'
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  authenticate :admin do
    resources :admins, only: [:index]
    scope :admins do
      resources :real_estate, only: [:new, :create, :edit, :update, :destroy, :index]
    end
  end
  resources :real_estate do
    collection do
      match 'search' => 'application#index', via: [:get, :post], as: :search
      get 'rent' => 'application#real_estate_for_rent'
      get 'sell' => 'application#real_estate_for_sell'
    end

    member do
      get 'details' => 'application#show_real_estate', as: :details
    end
  end
  get 'real_estate/index', to: 'real_estate#index', as: :list_real_estate
  get 'real_estate/:id', to: 'real_estate#show', as: :show_real_estate
  get 'contato', to: 'application#contact', as: :contact

end
