class Post < ApplicationRecord

  has_many :post_categories ,dependent: :destroy
  has_many :categories, through: :post_categories
  has_many :responses, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :categories,  allow_destroy: true

  validates :title, length: { in: 1..30 }
  validates :text, length: { in: 1..300 }
end
