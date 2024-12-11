class Syllabus < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :syllabuses_modules, dependent: :destroy
  has_many :libraries

  validates :title, presence: true
  validates :description, presence: true
end
