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
  if tarea.tipo_tarea
    json.tipo tarea.tipo_tarea.nombre.humanize
  end
  json.modulo tarea.modulo
  json.responsable_sistema Responsable.find(tarea.responsable_sistema_id).nombre
  json.responsable_planta Responsable.find(tarea.responsable_planta_id).nombre
  json.lugar tarea.lugar.nombre
end
