json.extract! @proyecto, :nombre, :fecha_inicio, :fecha_fin, :hh, :hhi

json.etapas @proyecto.etapas do |etapa|
  json.etapa etapa.nombre
  json.hh etapa.hh
  json.hhi etapa.hhi
  json.e_fecha_inicio etapa.fecha_inicio
  json.e_fecha_fin etapa.fecha_fin
end
