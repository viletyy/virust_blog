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

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
