json.array!(@modulos) do |modulo|
  json.extract! modulo, :nombre, :descripcion, :proyecto_id
  json.url modulo_url(modulo, format: :json)
end
