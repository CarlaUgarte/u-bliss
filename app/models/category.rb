class Category < ApplicationRecord
  has_many :syllabuses
  has_one_attached :image
  validates :name, presence: true, uniqueness: true
end
