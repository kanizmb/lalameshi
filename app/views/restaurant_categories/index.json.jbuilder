json.array!(@restaurant_categories) do |restaurant_category|
  json.extract! restaurant_category, :id, :restaurant_id, :category_id
  json.url restaurant_category_url(restaurant_category, format: :json)
end
