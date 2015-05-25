json.array!(@categories) do |category|
  json.extract! category, :id, :item_id
  json.url category_url(category, format: :json)
end
