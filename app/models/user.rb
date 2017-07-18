class User < ApplicationRecord
  authenticates_with_sorcery!
  attr_accessor :password, :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :username
  validates_uniqueness_of :username

  def admin?
    is_admin
  end
end
