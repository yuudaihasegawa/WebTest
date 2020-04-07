class Response < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :message, length: { in: 1..50 }
end
