class User < ActiveRecord::Base
  attr_accessor :remember_token

  before_save {self.email = self.email.downcase}
  before_save {self.name = self.name.capitalize}
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 244}, 
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, length: {minimum: 6}, allow_blank: true
  has_many :microposts, dependent: :destroy
  scope :desc, -> {order(created_at: :desc)}

  has_many :active_relationships, class_name:  'Relationship', 
                                  foreign_key: 'follower_id',
                                  dependent:   :destroy 

  has_many :following, through: :active_relationships, source: :followed
end