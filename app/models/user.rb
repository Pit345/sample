class User < ActiveRecord::Base
  before_save {self.email = self.email.downcase} #исп. колбэк модели, во втором случае можно без self
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 244}, 
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, length: {minimum: 6}, allow_blank: true
  has_many :microposts, dependent: :destroy
  scope :descending, -> {order(created_at: :desc)}
end