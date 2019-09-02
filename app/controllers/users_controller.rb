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
    # Создаем болванку нового пользователя.
    @user = User.new
  end

  # Действие create будет отзываться при POST-запросе по адресу /users из формы
  # нового пользователя, которая находится в шаблоне на странице /users/new.
  def create
    # Если пользователь уже авторизован, ему не нужна новая учетная запись,
    # отправляем его на главную с сообщением.
    redirect_to root_url, alert: 'Вы уже залогинены' if current_user.present?

    # Иначе, создаем нового пользователя с параметрами, которые нам предоставит
    # метод user_params.
    @user = User.new(user_params)
    
    # Пытаемся сохранить пользователя.
    if @user.save
      # Если удалось, отправляем пользователя на главную с сообщение, что
      # пользователь создан.
      redirect_to root_url, notice: 'Пользователь успешно зарегестрирован!'
    else
      # Если не удалось по какой-то причине сохранить пользователя, то рисуем
      # (обратите внимание, это не редирект), страницу new с формой
      # пользователя, который у нас лежит в переменной @user. В этом объекте
      # содержатся ошибки валидации, которые выведет шаблон формы.
      render 'new'
    end
  end

  # Действие edit будет отзываться по адресу /users/:id/edit, например,
  # /users/1/edit
  #
  # Перед этим действием сработает before_action :load_user и в переменной @user
  # у нас будет лежать пользовать с нужным id равным params[:id].
  def edit
    @user = User.find params[:id]
  end

  # Это действие отзывается, когда пользователь заходит по адресу /users/:id,
  # например /users/1
  #
  # Перед этим действием сработает before_action :load_user и в переменной @user
  # у нас будет лежать пользовать с нужным id равным params[:id].
  def show
    @user = User.find params[:id]
    # берём вопросы у найденного юзера
    @questions = @user.questions.order(created_at: :desc)
  
    # Для формы нового вопроса создаём заготовку, вызывая build у результата вызова метода @user.questions.
    @new_question = @user.questions.build
   
    # Счетчик количества вопросов
    @questions_count = @questions.count
  end

  private

  # Явно задаем список разрешенных параметров для модели User. Говорим, что
  # у хэша params должен быть ключ :user. Значением этого ключа может быть хэш с
  # ключами: :email, :password, :password_confirmation, :name, :username и
  # :avatar_url. Другие ключи будут отброшены.
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 :name, :username, :avatar_url)
  end
end
