json.array!(@responsables) do |responsable|
  json.extract! responsable, :nombre, :email, :fono, :lugar_id
  json.url responsable_url(responsable, format: :json)
end
