class HashtagsQuestion < ApplicationRecord
    belongs_to :hashtag
    belongs_to :questions

    validates: :hashtag_id, uniqueness: {scope: :question_id}
end
