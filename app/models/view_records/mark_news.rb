# == Schema Information
#
# Table name: view_records
#
#  id           :bigint(8)        not null, primary key
#  type         :string(255)
#  user_id      :bigint(8)
#  ip_address   :string(255)
#  subject_type :string(255)
#  subject_id   :bigint(8)
#  status       :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ViewRecords::MarkNews < ViewRecord

  belongs_to :news, class_name: "News", foreign_key: :subject_id, counter_cache: :viewed_counter
  belongs_to :user, required: false

end
