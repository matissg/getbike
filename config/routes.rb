Rails.application.routes.draw do

  root 'employees#index'

  resources :employees
  resources :bikes
  resources :rides, except: [:show]

end
