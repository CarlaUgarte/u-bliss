class Category < ApplicationRecord
  has_many :syllabuses

  validates :name, presence: true, uniqueness: true
end
