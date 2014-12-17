json.array!(@jornadas) do |jornada|
  json.extract! jornada, :id, :league_id, :season_id, :date
  json.url jornada_url(jornada, format: :json)
end
