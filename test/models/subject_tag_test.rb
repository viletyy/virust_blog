# == Schema Information
#
# Table name: subject_tags
#
#  id           :bigint(8)        not null, primary key
#  tag_id       :integer
#  subject_type :string(255)
#  subject_id   :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class SubjectTagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
