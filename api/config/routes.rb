Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # devise_for :users, controllers: {
  #   sessions: "users/sessions",
  #   registrations: "users/registrations"
  # }

  # get "users/current_user", to: "users/current_user#index"

  devise_for :users,
    defaults: { format: :json },
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }

  namespace :api do
    namespace :v1 do
      namespace :players do
        resources :offers, only: [:index] do
          collection do
            patch :edit
            patch :claim
          end
        end
        resource :profiles, only: %i[edit update]
        resource :offers, only: [:index] do
          member do
            post :claim, to: 'offers#claim'
          end
        end
      end
    end

  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
