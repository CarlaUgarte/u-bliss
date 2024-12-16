class TasksController < ApplicationController
  def toggle_complete
    # Agregar o quitar la lección de las completadas
    lecture_id = params[:id].to_i
    syllabus_id = params[:syllabus_id].to_i
    session[:completed_lectures] ||= []

    if params[:completed] == "true"
      session[:completed_lectures] << lecture_id unless session[:completed_lectures].include?(lecture_id)
    else
      session[:completed_lectures].delete(lecture_id)
    end

    # Calcular el progreso
    total_lectures = Syllabus.find(syllabus_id).syllabus_modules.sum { |m| m.lectures.count }
    completed_lectures = session[:completed_lectures].size
    progress = total_lectures.zero? ? 0 : (completed_lectures.to_f / total_lectures * 100).round

    # Actualizar los logros y devolver el progreso
    update_achievements(completed_lectures, total_lectures)

    render json: { progress: progress, achievements: current_user.achievements }
  end

  def update_achievements(completed_lectures, total_lectures)
    # Ejemplo: Asigna un logro cuando se completan un 50% de las lecciones
    if completed_lectures >= total_lectures / 2 && !current_user.achievements.exists?(name: "Medio Curso Completo")
      Achievement.create(user: current_user, name: "Medio Curso Completo", description: "¡Has completado el 50% del curso!")
    end
  end
end

