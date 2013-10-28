json.array!(@tareas) do |tarea|
  json.extract! tarea, :hh, :actividad
  json.url tarea_url(tarea, format: :json)
end
