Rails.application.routes.draw do
  # Это правило говорит: если пользователь заходит по адресу /, направь его в
  # контроллер users, действие index. Грубо говоря, на главной странице у нас
  # список юзеров.
  root to: 'users#index'

  # Ресурс пользователей
  resources :users

  # Ресурс сессия (только три экшена :new, :create, :destroy)
  resource :session, only: [:new, :create, :destroy]

  # Ресурс вопросов (кроме экшенов :show, :new, :index)
  resources :questions, except: [:show, :new, :index]

  resources :hashtags, only: [:show]
end
