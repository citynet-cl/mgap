json.array!(@ccccs) do |cccc|
  json.extract! cccc, :nombre, :algo, :hm, :nacimiento, :edad
  json.url cccc_url(cccc, format: :json)
end
