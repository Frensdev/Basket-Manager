json.array!(@matches) do |match|
  json.extract! match, :id, :jornada_id, :hometeam_id, :awayteam_id
  json.url match_url(match, format: :json)
end
