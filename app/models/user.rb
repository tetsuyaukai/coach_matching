# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  gender     :integer
#  birthday   :date
#  email      :string
#  profile    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_many :users_sports
  has_many :sports, through: :users_sports
  has_many :contents
  has_many :places, through: :contents

  enum gender: { male: 1, female: 2, other: 3 }
end
