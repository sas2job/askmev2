# Модель пользователя.

# Каждый экземпляр этого класса — загруженная из БД инфа о конкретном юзере.

class User < ApplicationRecord

  # Эта команда добавляет связь с моделью Question на уровне объектов она же
  # добавляет метод .questions к данному объекту.
  #
  # Когда вызывается метод questions у экземпляра класса User, рельсы
  # поймут это как просьбу найти в базе все объекты класса Questions со
  # значением user_id равный user.id.
  has_many :questions

  # Валидация, которая проверяет, что поля email и username не пустые и не равны
  # nil. Если не задан email и username, объект не будет сохранен в базу.
  validates :email, :username, presence: true

  # Валидация, которая проверяет уникальность полей email и username. Если в
  # базе данных уже есть записи с такими email и/или username, объект не будет
  # сохранен в базу.
  validates :email, :username, uniqueness: true
end
