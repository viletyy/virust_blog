# == Schema Information
#
# Table name: comments
#
#  id           :bigint(8)        not null, primary key
#  type         :string(255)
#  user_id      :bigint(8)
#  content      :string(255)
#  subject_type :string(255)
#  subject_id   :bigint(8)
#  status       :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Comments::ReplyNewsComment < Comment
  belongs_to :comment, class_name: "Comments::MarkNews", foreign_key: :subject_id
end
