# == Schema Information
#
# Table name: tasks
#
#  id         :bigint(8)        not null, primary key
#  source_id  :bigint(8)
#  begin_time :datetime
#  hours      :integer          default(24)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
