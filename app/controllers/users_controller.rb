# Контроллер, управляющий пользователями. Должен уметь:
#
#   1. Показывать страницу пользователя
#   2. Создавать новых пользователей
#   3. Позволять пользователю редактировать свою страницу
#
class UsersController < ApplicationController
  def index
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
        Question.new(text: 'Как дела?', created_at: Date.parse('27.03.2016'))
      ]  
  end
end
