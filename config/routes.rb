Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :students do
    member do
      get :register
      post :assign
    end
  end
  resources :teachers
  resources :courses
  root to: "students#index"
end
