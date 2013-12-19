json.array! @tareas_listado1 do |tarea|
  json.fecha_registro tarea.fecha_registro
  json.hh tarea.hh
  json.actividad tarea.actividad
  json.proyecto tarea.proyecto.nombre
  json.cliente tarea.proyecto.cliente.nombre.humanize
  #json.estado_proyecto tarea.proyecto.estado ? 'Cerrados' : 'En curso'
  #if tarea.etapa_id
   # json.etapa_proyecto tarea.etapa.nombre
  #end
  json.usuario tarea.user.usuario.humanize
end
