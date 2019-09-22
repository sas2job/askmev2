class Hashtag < ApplicationRecord
    REGEXP = /#[[:word:]_]+/
    has_many :hashtags_questions
    has_many :questions, through: :hashtags_questions

    before_validation :downcase_hastags

    validates :name, uniqueness: true

    def downcase_hastags
        self.name.downcase!
      end

    def to_param
        name
    end
end
