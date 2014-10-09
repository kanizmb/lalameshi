json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :restaurant_name, :address, :tel, :holiday, :image, :budget, :tabelog_id, :tabelog_score, :time_required, :distance, :geocode
  json.url restaurant_url(restaurant, format: :json)
end
