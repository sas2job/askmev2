# Эта библиотека понадобится нам для шифрования.
require 'openssl'

# Модель пользователя.

# Каждый экземпляр этого класса — загруженная из БД инфа о конкретном юзере.

class User < ApplicationRecord

  # Виртуальное поле, которое не сохраняется в базу. Из него перед сохранением
  # читается пароль, и сохраняется в базу уже зашифрованная версия пароля в
  # реальные поля password_salt и password_hash.
  attr_accessor :password

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

  # Поле password нужно только при создании (create) нового юзера — регистрации.
  # При аутентификации (логине) мы будем сравнивать уже зашифрованные поля.
  # Другой способ записи:
  # validates_presence_of :password, on: :create
  validates :password, presence: true, on: :create

  # Валидация, которая проверяет совпадения значений полей password и
  # password_confirmation. Понадобится при создании формы регистрации, чтобы
  # снизить число ошибочно введенных паролей.
  validates_confirmation_of :password

end
