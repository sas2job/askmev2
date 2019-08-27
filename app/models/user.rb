# Модель пользователя.

# Каждый экземпляр этого класса — загруженная из БД инфа о конкретном юзере.

class User < ApplicationRecord
  # Валидация, которая проверяет, что поля email и username не пустые и не равны
  # nil. Если не задан email и username, объект не будет сохранен в базу.
  validates :email, :username, presence: true
end
