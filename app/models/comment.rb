# == Schema Information
#
# Table name: comments
#
#  id             :bigint(8)        not null, primary key
#  type           :string(255)
#  user_id        :integer
#  content        :text(65535)
#  subject_type   :string(255)
#  subject_id     :string(255)
#  liked_counter  :integer          default(0)
#  viewed_counter :integer          default(0)
#  status         :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Comment < ApplicationRecord
  belongs_to :subject, polymorphic: true
end
