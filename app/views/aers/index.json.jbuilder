json.array!(@aers) do |aer|
  json.extract! aer, :email, :password_digest
  json.url aer_url(aer, format: :json)
end
