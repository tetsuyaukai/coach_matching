# == Schema Information
#
# Table name: contents
#
#  id             :integer          not null, primary key
#  place_id       :integer
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  menu           :text
#  scheduled_date :date
#  scheduled_time :time
#

class Content < ApplicationRecord

  belongs_to :place
  belongs_to :user
  has_many :agreements

  validates :scheduled_time, presence: true
  validates :scheduled_date, presence: true
  validates :place_id, presence: true
  validates :scheduled_time, presence: true
end
