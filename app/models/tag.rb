# == Schema Information
#
# Table name: tags
#
#  id         :bigint(8)        not null, primary key
#  type       :string(255)
#  name       :string(255)
#  status     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  default_scope { where.not(status: -1) }

  has_many :subject_tags

  # scope
  scope :order_with_asc, -> (col){order("#{col} asc")}
  scope :order_with_desc, -> (col){order("#{col} desc")}
  scope :search, -> (keyword){where("name like ?", "%#{keyword}%")}
  scope :is_show_home, ->(){where(status:1)}
end
