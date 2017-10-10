# == Schema Information
#
# Table name: contents
#
#  id           :integer          not null, primary key
#  place_id     :integer
#  user_id      :integer
#  scheduled_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Content < ApplicationRecord
  belongs_to :place
  belongs_to :user
end
