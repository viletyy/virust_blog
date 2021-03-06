# == Schema Information
#
# Table name: news
#
#  id               :bigint(8)        not null, primary key
#  title            :string(255)
#  desp             :string(255)
#  content          :text(4294967295)
#  category_id      :bigint(8)
#  source_id        :bigint(8)
#  liked_counter    :integer          default(0)
#  viewed_counter   :integer          default(0)
#  comments_counter :integer          default(0)
#  status           :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class News < ApplicationRecord

  # ORM关系
  belongs_to :category, class_name: "Categories::MarkNews", foreign_key: :category_id
  belongs_to :source

  has_many :comments, class_name: "Comments::MarkNews", as: :subject
  has_many :like_records, class_name: "LikeRecords::MarkNews", as: :subject
  has_many :view_records, class_name: "ViewRecords::MarkNews", as: :subject
  has_many :subject_tags, as: :subject
  has_many :tags, class_name: "Tags::MarkNews", as: :subject, through: :subject_tags

  # scope
  scope :order_with_asc, -> (col){order("#{col} asc")}
  scope :order_with_desc, -> (col){order("#{col} desc")}
  scope :search, -> (keyword){where("title like ?", "%#{keyword}%")}
  scope :is_show_home, -> {where(status:1)}
  scope :where_with_time, ->(col,time){where("#{col} > ?", "#{time}")}
end
