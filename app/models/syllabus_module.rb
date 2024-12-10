class SyllabusModule < ApplicationRecord
  belongs_to :syllabus
  has_many :lectures, dependent: :destroy

  validates :name, presence: true
end
