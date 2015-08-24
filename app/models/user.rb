class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Access Control
  include ActsAsAuthoritah::Core
  acts_as_authoritah Rails.root.join('config/access_rights/')

  def usertype(options = {})
    admin? ? 'admin' : (agent? ? 'agent' : (new_record? ? 'anonymous' : nil))
  end

  def admin?
    role_id == Role.list.admin
  end

  def agent?
    role_id == Role.list.agent
  end
end
