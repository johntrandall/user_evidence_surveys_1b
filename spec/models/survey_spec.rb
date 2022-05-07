# == Schema Information
#
# Table name: surveys
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Survey, type: :model do
  it 'has a factory' do
    expect{FactoryBot.create(:survey)}.not_to raise_error
  end
end
