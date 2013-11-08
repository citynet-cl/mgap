json.array!(@lugars) do |lugar|
  json.extract! lugar, :nombre, :ciudad, :area, :planta, :belongs_to
  json.url lugar_url(lugar, format: :json)
end
