Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :tasks do 
    resources :comments, only: [:new, :create, :destroy]
  end
  post '/tasks/fetch', to: 'tasks#fetch'
  patch '/tasks/:id/done', to: 'tasks#done', as: 'task_done'
end
