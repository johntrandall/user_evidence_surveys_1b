# == Schema Information
#
# Table name: surveys
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Survey < ApplicationRecord
  has_many :questions, dependent: :destroy
end
