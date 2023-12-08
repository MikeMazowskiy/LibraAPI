Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :lists, only: %i[index show create update destroy]
      resources :profiles, only: %i[index show create update destroy]
      resources :books, only: %i[index show create update destroy] do
        resources :reviews, only: %i[index create update destroy]
      end
    end
  end
end
