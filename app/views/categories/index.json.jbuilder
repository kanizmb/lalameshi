json.array!(@categories) do |category|
  json.extract! category, :id, :name, :images
  json.url category_url(category, format: :json)
end
