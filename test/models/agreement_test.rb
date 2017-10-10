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

require 'test_helper'

class AgreementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
