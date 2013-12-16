json.array! @tareas do |tarea|
  json.fecha_registro tarea.fecha_registro
  json.hh tarea.hh
  json.actividad tarea.actividad
  json.proyecto tarea.proyecto.nombre
  json.estado_proyecto tarea.proyecto.estado ? 'Cerrados' : 'En curso'
  if tarea.etapa_id
    json.etapa_proyecto tarea.etapa.nombre
  end
  json.usuario tarea.user.usuario
end
