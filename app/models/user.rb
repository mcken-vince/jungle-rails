class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates_length_of :password, minimum: 5


  def self.authenticate_with_credentials(email, password)
    @email = email.strip.downcase
    @user = self.find_by_email(@email)
  
    if @user && @user.authenticate(password)
      return @user
    else
      return nil
    end
  end
end