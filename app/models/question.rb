# Модель вопроса.

# Каждый экземпляр этого класса — загруженная из БД информация о конкретном
# вопросе.

class Question < ApplicationRecord
  # Эта команда добавляет связь с моделью User на уровне объектов она же
  # добавляет метод .user к данному объекту.
  #
  # Когда вызывается метод user у экземпляра класса Question, рельсы
  # поймут это как просьбу найти в базе объект класса User со значением id
  # равный question.user_id.
  belongs_to :user  

  # Эта валидация препятствует созданию вопросов, у которых поле text пустое, объект не будет сохранен в базу.
  validates :text, presence: true
end
