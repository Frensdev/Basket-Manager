json.array!(@teams) do |team|
  json.extract! team, :id, :league_id, :season_id, :name, :city, :balance, :socios
  json.url team_url(team, format: :json)
end
