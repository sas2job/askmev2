Rails.application.routes.draw do
  # Это правило говорит: если пользователь заходит по адресу /, направь его в
  # контроллер users, действие index. Грубо говоря, на главной странице у нас
  # список юзеров.
  root to: 'users#index'

  # Эти две строчки добавляют ресурсы для пользователей и вопросов. Ресурс — это
  # набор путей для управления соответствующей моделью. 
  resources :users
  resources :questions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'show' => 'users#show'
end
