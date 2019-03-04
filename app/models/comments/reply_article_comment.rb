# == Schema Information
#
# Table name: comments
#
#  id           :bigint(8)        not null, primary key
#  type         :string(255)
#  user_id      :integer
#  content      :string(255)
#  subject_type :string(255)
#  subject_id   :string(255)
#  status       :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Comments::ReplyArticleComment < Comment
  belongs_to :comment, class_name: "Comments::MarkArticle", foreign_key: :subject_id
end
