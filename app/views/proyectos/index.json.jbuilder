json.array! @proyectos do |proyecto|
  json.proyecto proyecto.nombre
  json.hhp proyecto.hh
  json.hhi proyecto.tareas.sum(:hh)
  json.fecha_inicio proyecto.fecha_inicio
  json.fecha_fin proyecto.fecha_fin
  json.cliente proyecto.cliente.nombre.humanize
 #json.estado_proyecto proyecto.estado ? 'Cerrados' : 'En curso'

json.etapas proyecto.etapas do |etapa|
  json.etapa etapa.nombre
  json.hh etapa.hh
  json.hhi etapa.hhi
  json.e_fecha_inicio etapa.fecha_inicio
  json.e_fecha_fin etapa.fecha_fin
end
end
