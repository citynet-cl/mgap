json.array! @tareas do |tarea|
  json.fecha_registro tarea.fecha_registro
  json.hh tarea.hh
  json.actividad tarea.actividad
  json.proyecto tarea.proyecto.nombre
  json.usuario tarea.user.usuario
end
