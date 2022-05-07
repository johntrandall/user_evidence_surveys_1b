# == Schema Information
#
# Table name: responses
#
#  id          :bigint           not null, primary key
#  text        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint           not null
#
# Indexes
#
#  index_responses_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#
FactoryBot.define do
  factory :answer do
    question { create(:question) }
  end
end
