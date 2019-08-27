# Миграция создана генератором
# rails g migration AddUserToQuestion user:references
# У вопроса всегда есть один адресат, а у пользователя может быть много вопросов.

class AddUserToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :user, foreign_key: true
  end
end
