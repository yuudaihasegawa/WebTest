class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts,dependent: :destroy
  has_many :responses,dependent: :destroy
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, length: { in: 1..30 }
  validates :introduction, length: { maximum: 150 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  attachment :profile_image
end
