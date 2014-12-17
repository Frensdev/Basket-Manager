json.array!(@seasons) do |season|
  json.extract! season, :id, :date
  json.url season_url(season, format: :json)
end
