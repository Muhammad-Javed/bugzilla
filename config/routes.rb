Rails.application.routes.draw do
  devise_for :users

  resources :projects do
    member do
      get :add_bug
      get :show_bug
      post :assign_bug
      post :adds
      post :update_bug
      delete :remove_bug
      delete :remove
    end

    resources :bugs, except: [:index, :show]
  end

  root "projects#index"
end
