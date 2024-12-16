class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :syllabuses
  has_many :libraries
  has_many :comments
  #gamificacion
  has_many :user_points
  has_many :achievements
  #gamificacion
  def total_points
    user_points.sum(:points)
  end

  def add_points(amount)
    self.user_points.create(points: amount)
  end

  def check_for_achievements
    if total_points >= 100 && achievements.where(name: "100 Puntos").empty?
      achievements.create(name: "100 Puntos", description: "¡Has alcanzado 100 puntos!", achieved_at: Time.now)
    end
  end
end
