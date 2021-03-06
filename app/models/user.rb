class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, format: { with: /[^\s]@[^\s]\.[^\s]/ }
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\Z/i }
  validates :password_confirmation, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\Z/i }
  has_secure_password
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :comments
  
end
