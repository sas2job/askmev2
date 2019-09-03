# Модуль хэлпера ApplicationHelper
#
# В этом файле мы можем писать вспомогательные методы (хелперы) для шаблонов,
# (представлений, вьюх) нашего приложения
module ApplicationHelper
  # Этот метод возвращает ссылку на аватарку пользователя, если она у него есть.
  # Или ссылку на дефолтную аватарку, которую положим в app/assets/images
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end
  
  def sklonenie(number, вопрос, вопроса, вопросов)
    number = 0 if number.nil? || !number.is_a?(Numeric)

    return вопросов if (number % 100).between?(11, 14)

    ostatok = number % 10

    return вопрос if ostatok == 1

    return вопроса if ostatok.between?(2, 4)

    return вопросов if ostatok.between?(5, 9) || ostatok.zero?
  end
  
  # Хелпер, рисующий span тэг с иконкой из font-awesome
  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
