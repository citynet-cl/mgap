json.array!(@proyectos) do |proyecto|
  json.extract! proyecto, :nombre, :hh, :descripcion
  json.url proyecto_url(proyecto, format: :json)
end
