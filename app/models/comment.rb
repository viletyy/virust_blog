# == Schema Information
#
# Table name: comments
#
#  id           :bigint(8)        not null, primary key
#  type         :string(255)
#  user_id      :integer
#  content      :string(255)
#  subject_type :string(255)
#  subject_id   :integer
#  status       :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Comment < ApplicationRecord
  default_scope { where.not(status: -1) }

  belongs_to :subject, polymorphic: true
end
