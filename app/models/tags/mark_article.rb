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

class Tags::MarkArticle < Tag

  has_many :articles, through: :subject_tags, source: :subject, source_type: "Article"

end
