Rails.application.routes.draw do
  root controller: :pages, action: :root

  namespace :api do
    scope :private_api do
      resources :locations, only: :show, param: :country_code
      resources :target_groups, only: :show, param: :country_code
      post :evaluate_target, controller: :targets, action: :create
    end
    namespace :v1 do
      resources :locations, only: :show, param: :country_code
      resources :target_groups, only: :show, param: :country_code
    end
  end
end
