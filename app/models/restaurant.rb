class Restaurant < ApplicationRecord

  validates :name, :address, presence: true
  # validates :category, presence: true

  has_many :reviews, dependent: :destroy # anytime a restaurant is destroyed, so are the reviews
end
