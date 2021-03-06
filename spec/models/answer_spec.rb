# == Schema Information
#
# Table name: answers
#
#  id          :bigint           not null, primary key
#  email       :string
#  name        :string
#  text        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint           not null
#
# Indexes
#
#  index_answers_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#
require 'rails_helper'

RSpec.describe Answer, type: :model do
  it 'has a factory' do
    expect{FactoryBot.create(:answer)}.not_to raise_error
  end
end
