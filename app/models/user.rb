class User < ApplicationRecord
  has_many :article
  validates :username, presence: true, uniqueness: {case_sensitive: false},
  length: {minimum: 2, maximum: 100}
  VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: {case_sensitive: false},
  format: {with: VALID_EMAIL_REGEX}
  

end
