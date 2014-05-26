MovieRecommendationSystem::Application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users,   only: [:create, :update, :destroy]
      resources :movies,  except: [:edit, :show]
    
      resources :movies, only: [:create, :update, :destroy] do
        resources :users do
          resources :likes, only: [:create]
        end
      end

      resources :likes, only: [:destroy, :show]
    end
  end
end
