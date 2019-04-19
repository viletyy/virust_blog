# == Schema Information
#
# Table name: like_records
#
#  id           :bigint(8)        not null, primary key
#  type         :string(255)
#  user_id      :bigint(8)
#  ip_address   :string(255)
#  subject_type :string(255)
#  subject_id   :bigint(8)
#  status       :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class LikeRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
