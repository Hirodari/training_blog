class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: {minimum: 5, maximum: 20}
  validates :description, presence: true, length: {minimum: 10, maximum: 2000}
  #validates :author, presence: true, length: {minimum: 5, maximum: 20}
  validates :user_id, presence: true
end
