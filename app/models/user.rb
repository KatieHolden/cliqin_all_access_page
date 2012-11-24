class User < ActiveRecord::Base
  acts_as_predecessor

  # attr_accessible :login, :password, :password_confirmation
  has_secure_password

  # before_save { |user| user.login = login.downcase }
  # before_save :create_remember_token

  validates :login, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true, :length => { :minimum => 6 }
  validates :password_confirmation, :presence => true, :on => :create

  def instructor?
    self.is_a?(Instructor)
  end

  # private

  #   def create_remember_token
  #     self.remember_token = SecureRandom.urlsafe_base64
  #   end


end
