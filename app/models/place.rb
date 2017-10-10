# == Schema Information
#
# Table name: places
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Place < ApplicationRecord
  has_many :contents
  has_many :users, through: :contents
end
