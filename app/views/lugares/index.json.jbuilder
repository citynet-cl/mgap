json.array!(@lugares) do |lugar|
  json.extract! lugar, :nombre, :ciudad, :area, :planta, :cliente_id
  json.url lugar_url(lugar, format: :json)
end
