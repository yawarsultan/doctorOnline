json.array!(@histories) do |history|
  json.extract! history, :id, :firstname, :lastname, :age, :date, :reason
  json.url history_url(history, format: :json)
end
