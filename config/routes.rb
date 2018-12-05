Rails.application.routes.draw do
  mount Crono::Web, at: '/crono'
  post 'users/:user_id/tasks/update_task/:id', to: 'tasks#update_task', as: 'update_user_task'
  post 'users/password', to: 'users#password', as: 'pass'
  get 'users/forgot_password', to:'users#forgot_password', as: 'forgot_pass'
  get 'users/reset_password', to:'users#reset_password'
  post 'users/reset_password2', to:'users#reset_password_2', as: 'reset2'
  get 'users/login', to: 'users#login', as: 'login'
  post 'users/authenticate', to: 'users#auth', as:'auth'
  get 'users/logout', to: 'users#logout', as: 'logout'
  root 'users#landing'
  post '/admin/update', to: 'users#update_admin', as: 'update_admin'
  get '/admin', to: 'users#admin', as: 'admin'
  get 'users/mail_auth', to:'users#mail_confirm'
  resources :users do
    resources :tasks
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
