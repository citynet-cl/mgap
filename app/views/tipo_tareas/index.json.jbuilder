json.array!(@tipo_tareas) do |tipo_tarea|
  json.extract! tipo_tarea, :nombre
  json.url tipo_tarea_url(tipo_tarea, format: :json)
end
