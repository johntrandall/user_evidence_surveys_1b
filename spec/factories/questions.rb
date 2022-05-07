# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  survey_id  :bigint           not null
#
# Indexes
#
#  index_questions_on_survey_id  (survey_id)
#
# Foreign Keys
#
#  fk_rails_...  (survey_id => surveys.id)
#
FactoryBot.define do
  factory :question do
    text { "“Aren’t you a little short for a stormtrooper?" }
    survey { create(:survey) }
  end
end
