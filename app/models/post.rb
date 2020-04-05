class Post < ApplicationRecord

  has_many :post_categories ,dependent: :destroy
  has_many :categories, through: :post_categories
  belongs_to :user

  accepts_nested_attributes_for :categories,  allow_destroy: true
end
