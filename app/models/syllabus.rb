class Syllabus < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :syllabus_modules, dependent: :destroy
  has_many :libraries

  validates :title, presence: true
  validates :description, presence: true
end
