# == Schema Information
#
# Table name: agreements
#
#  id         :integer          not null, primary key
#  content_id :integer
#  user_id    :integer
#  status     :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Agreement < ApplicationRecord
  belongs_to :content
  belongs_to :user

  enum status: { request: 0, agree: 2, deny: 3 }
end
