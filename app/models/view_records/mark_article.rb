# == Schema Information
#
# Table name: view_records
#
#  id           :bigint(8)        not null, primary key
#  type         :string(255)
#  user_id      :integer
#  ip_address   :string(255)
#  subject_type :string(255)
#  subject_id   :integer
#  status       :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ViewRecords::MarkArticle < ViewRecord

  belongs_to :article, class_name: "Article", foreign_key: :subject_id, counter_cache: :viewed_counter
  belongs_to :user, required: false

  validates :user_id, uniqueness: {scope: [:ip_address, :subject_id, :subject_type], message: "该用户或ip地址已经有浏览记录了"}
end
