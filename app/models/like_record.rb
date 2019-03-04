# == Schema Information
#
# Table name: like_records
#
#  id           :bigint(8)        not null, primary key
#  type         :string(255)
#  user_id      :integer
#  ip_address   :string(255)
#  subject_type :string(255)
#  subject_id   :string(255)
#  status       :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class LikeRecord < ApplicationRecord
  default_scope { where.not(status: -1) }
  
  belongs_to :subject, polymorphic: true
end
