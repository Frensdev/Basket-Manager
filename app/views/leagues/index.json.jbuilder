json.array!(@leagues) do |league|
  json.extract! league, :id, :season_id
  json.url league_url(league, format: :json)
end
