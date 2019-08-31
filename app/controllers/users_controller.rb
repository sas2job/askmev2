# Контроллер, управляющий пользователями. Должен уметь:
#
#   1. Показывать страницу пользователя
#   2. Создавать новых пользователей
#   3. Позволять пользователю редактировать свою страницу
#
class UsersController < ApplicationController
  def index
    # Создан массив из двух болванок пользователей. Для создания фейковой
    # модели вызывается метод User.new, который создает модель, не
    # записывая её в базу.
    @users = [
      User.new(
        id: 1,
        name: 'Alexander',
        username: 'Alex',
        avatar_url: 'https://i.pravatar.cc/302'
      ),
      User.new(id: 2, name: 'UserExample', username: 'UsernameExample')
    ]
  end

  def new
  end

  def edit
  end

  # Это действие отзывается, когда пользователь заходит по адресу /users/:id,
  # например /users/1.
  def show
    # Болванка пользователя
    @user = User.new(
      name: 'Alexander',
      username: 'Alex',
      avatar_url: 'https://i.pravatar.cc/302')
    # Болванка вопроса
      @questions = [
        Question.new(text: 'Как дела?', created_at: Date.parse('27.03.2016')),
        Question.new(text: 'Как жизнь?', created_at: Date.parse('27.03.2016'))
      ]  

    # Болванка для нового вопроса
    @new_question = Question.new
  end
end
