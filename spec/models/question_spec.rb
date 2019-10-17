require "rails_helper"

describe Question do
  it { should validate_length_of(:text).is_at_most(255) }
end
