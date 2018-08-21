Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :students

  resources :students 

  resources :instructors
  resources :cohorts
  resources :courses
  resources :admins

  namespace :admins do
    resources :cohorts, :students, :course, :instructors
  end
end
