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

require 'test_helper'

class ContentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
