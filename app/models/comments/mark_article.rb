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

class Comments::MarkArticle < Comment
  belongs_to :article, class_name: "Article", counter_cache: :comments_counter
  has_many :comments_reply_article_comments, :class_name => 'Comments::ReplyArticleComment', as: :subject, foreign_key: :subject_id
end
