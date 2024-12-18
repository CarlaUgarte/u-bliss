class Syllabus < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :syllabus_modules, dependent: :destroy
  has_many :libraries
  has_many :reviews
  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
end
