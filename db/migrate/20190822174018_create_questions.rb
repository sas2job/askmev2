class CreateQuestions < ActiveRecord::Migration[5.2]
  # Миграция, создающая сущность (таблицу) вопрос в базе.
  def change
    # Создает таблицу "questions"
    create_table :questions do |t|
      # Со строковыми полями text, answer
      t.string :text
      t.string :answer

      # И created_at (время создания записи), updated_at (время последнего обновления записи).
      t.timestamps
    end
  end
end
