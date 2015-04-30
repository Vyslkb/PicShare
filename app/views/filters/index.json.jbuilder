json.array!(@filters) do |filter|
  json.extract! filter, :id, :blur, :blueshift, :charcoal, :oilpaint, :sepia, :name, :user_id
  json.url filter_url(filter, format: :json)
end
