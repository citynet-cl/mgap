json.array!(@otros) do |otro|
  json.extract! otro, :nombre, :descripcion
  json.url otro_url(otro, format: :json)
end
