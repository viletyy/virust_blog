# == Schema Information
#
# Table name: categories
#
#  id         :bigint(8)        not null, primary key
#  type       :string(255)
#  name       :string(255)
#  status     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Categories::MarkNews < Category
  has_many :news, foreign_key: :category_id
end
