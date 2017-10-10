# == Schema Information
#
# Table name: sports
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sport < ApplicationRecord
  has_many :users_sports
  has_many :users, through: :users_sports
end
