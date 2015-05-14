class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, 
            :presence => {:message => "Enter your email address!" },
            :format => { :with => VALID_EMAIL_REGEX, :message => "Enter a valid Email address !"},
            :uniqueness => {:case_sensitive => false, :message => "Email already exists!"},
            :confirmation => { :message => "Password mismatch!"}

end
