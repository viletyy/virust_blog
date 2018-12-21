# == Schema Information
#
# Table name: subject_tags
#
#  id           :bigint(8)        not null, primary key
#  tag_id       :integer
#  subject_type :string(255)
#  subject_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class SubjectTag < ApplicationRecord
  belongs_to :tag
  belongs_to :subject, polymorphic: true
end
