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

class Comments::MarkNews < Comment
  belongs_to :news, class_name: "News", counter_cache: :comments_counter
  has_many :comments_reply_news_comments, :class_name => 'Comments::ReplyNewsComment', as: :subject, foreign_key: :subject_id
end
