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
require 'rails_helper'

RSpec.describe Response, type: :model do
  it 'has a factory' do
    expect{FactoryBot.create(:response)}.not_to raise_error
  end
end
