# == Schema Information
#
# Table name: articles
#
#  id               :bigint(8)        not null, primary key
#  category_id      :integer
#  user_id          :integer
#  title            :string(255)
#  desp             :string(255)
#  content          :text(4294967295)
#  liked_counter    :integer          default(0)
#  viewed_counter   :integer          default(0)
#  comments_counter :integer          default(0)
#  status           :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Article < ApplicationRecord
  # default
  default_scope { where.not(status: -1) }

  # ORM关系
  belongs_to :user
  belongs_to :category, class_name: "Categories::MarkArticle", foreign_key: :category_id

  has_many :comments, class_name: "Comments::MarkArticle", as: :subject
  has_many :like_records, class_name: "LikeRecords::MarkArticle", as: :subject
  has_many :view_records, class_name: "ViewRecords::MarkArticle", as: :subject
  has_many :subject_tags, as: :subject
  has_many :tags, class_name: "Tags::MarkArticle", as: :subject, through: :subject_tags

  # scope
  scope :order_with_asc, -> (col){order("#{col} asc")}
  scope :order_with_desc, -> (col){order("#{col} desc")}
  scope :search, -> (keyword){where("title like ?", "%#{keyword}%")}
  scope :is_show_home, ->(){where(status:1)}

end
