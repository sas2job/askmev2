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

  has_many :hashtags_questions

  has_many :hashtags, through: :hashtags_questions

  belongs_to :author, class_name: 'User', optional: true

  # Эта валидация препятствует созданию вопросов, у которых нет пользователя.
  # Если задан пустой текст вопроса (поле text пустое), объект не будет сохранен
  # в базу.
  validates :user, :text, presence: true

  # Проверка максимальной длины текста вопроса (максимум 255 символов)
  validates :text, length: {maximum: 255}

  before_save :scan_hashtags

  private
  def scan_hashtags
    hashtags_questions.clear
    "#{text} #{answer}".downcase.scan(Hashtag::REGEXP).uniq.each do |name|
      hashtags << Hashtag.find_or_create_by!(name: name)
    end
  end
end
