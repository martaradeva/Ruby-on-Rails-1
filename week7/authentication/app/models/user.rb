require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  has_secure_password

  validates :first_name, :last_name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, 
            :presence => {:message => "Enter your email address!" },
            :format => { :with => VALID_EMAIL_REGEX, :message => "Enter a valid Email address !"},
            :uniqueness => {:case_sensitive => false, :message => "Email already exists!"},
            :confirmation => { :message => "Password mismatch!"}

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
