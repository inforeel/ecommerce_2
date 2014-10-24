json.array!(@stores) do |store|
  json.extract! store, :id, :name, :store_owner, :product
  json.url store_url(store, format: :json)
end
