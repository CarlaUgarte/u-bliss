class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Asociaciones
  has_many :reviews, dependent: :destroy
  has_many :syllabuses, dependent: :destroy
  has_many :libraries, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :user_points, dependent: :destroy
  has_many :achievements, dependent: :destroy
  has_one_attached :photo

  before_destroy :purge_photo, if: -> { photo.attached? }

  # Validaciones
  validates :first_name, :last_name, :username, presence: true

  # Métodos personalizados (gamificación)
  def total_points
    user_points.sum(:points)
  end

  def add_points(amount)
    user_points.create(points: amount)
  end

  def check_for_achievements
    if total_points >= 100 && achievements.where(name: "100 Puntos").empty?
      achievements.create(
        name: "100 Puntos",
        description: "¡Has alcanzado 100 puntos!",
        achieved_at: Time.now
      )
    end
  end

  private

  def purge_photo
    photo.purge
  end
end
