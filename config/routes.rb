Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  authenticate :admin do
    resources :admins, only: [:index]
  end
end
