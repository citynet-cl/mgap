json.array!(@etapas) do |etapa|
  json.extract! etapa, :nombre, :hh, :fecha_inicio, :fecha_fin, :proyecto_id, :modulo_id
  json.url etapa_url(etapa, format: :json)
end
