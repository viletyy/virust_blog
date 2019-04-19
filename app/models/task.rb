# == Schema Information
#
# Table name: tasks
#
#  id         :bigint(8)        not null, primary key
#  source_id  :bigint(8)
#  begin_time :datetime
#  hours      :integer          default(24)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Task < ApplicationRecord

  # ORM关系
  belongs_to :source
end
