class Restaurant < ApplicationRecord
  CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]
  validates :name, :address, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  # ["chinese", "italian", "japanese", "french", "belgian"].

  has_many :reviews, dependent: :destroy # anytime a restaurant is destroyed, so are the reviews
end
