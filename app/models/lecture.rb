class Lecture < ApplicationRecord
  belongs_to :syllabus_module
  has_many :comments, dependent: :destroy

  validates :details, presence: true
end
