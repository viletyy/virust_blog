# == Schema Information
#
# Table name: view_records
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

class ViewRecord < ApplicationRecord
  default_scope { where.not(status: -1) }

  belongs_to :subject, polymorphic: true

  validates :user_id, uniqueness: {scope: [:ip_address, :subject_id, :subject_type], message: "该用户或ip地址已经有浏览记录了"}

end
