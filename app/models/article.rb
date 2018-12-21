# == Schema Information
#
# Table name: articles
#
#  id               :bigint(8)        not null, primary key
#  category_id      :integer
#  user_id          :integer
#  title            :string(255)
#  desp             :string(255)
#  content          :text(65535)
#  liked_counter    :integer          default(0)
#  viewed_counter   :integer          default(0)
#  comments_counter :integer          default(0)
#  status           :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Article < ApplicationRecord

  # ORM关系
  belongs_to :user
  belongs_to :category, class_name: "Categories::Article", foreign_key: :category_id

  has_many :comments,class_name: "Comments::Article", as: :subject
  has_many :like_records, class_name: "LikeRecords::Article", as: :subject
  has_many :view_records, class_name: "ViewRecords::Article", as: :subject
  has_many :subject_tags, as: :subject
  has_many :tags, class_name: "Tags::Article",as: :subject,through: :subject_tags

end
