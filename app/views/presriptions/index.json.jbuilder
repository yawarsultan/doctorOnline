json.array!(@presriptions) do |presription|
  json.extract! presription, :id, :disease, :drug_name, :quantity, :user_id
  json.url presription_url(presription, format: :json)
end
