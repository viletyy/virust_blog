# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string(255)      default(""), not null
#  username               :string(255)      not null
#  encrypted_password     :string(255)      default(""), not null
#  gender                 :integer
#  phone                  :string(255)
#  nickname               :string(255)
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ORM关系
  has_many :articles
  has_many :comments
  has_many :like_records
  has_many :view_records

  # scope

  attr_accessor :signin

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if signin = conditions.delete(:signin)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value OR lower(phone) = :value", { :value => signin.downcase }]).first
    elsif conditions.has_key?(:username)|| conditions.has_key?(:phone) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  # TODO 前台用户权限管理预留
  def have_admin_role?
    return true
  end
end
