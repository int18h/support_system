Rails.application.routes.draw do
  scope module: :customer do
    root to: 'tickets#new'
    resources :tickets, only: %i[create show update], param: :reference
  end

  namespace :manager do
    root to: 'sessions#new'
    resource :sessions, only: %i[create destroy]
    resources :tickets, only: %i[index show update], param: :reference
  end
end
