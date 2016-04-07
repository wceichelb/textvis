json.array!(@responses) do |response|
  json.extract! response, :id, :email, :contents
  json.url response_url(response, format: :json)
end
