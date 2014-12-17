json.array!(@gamestats) do |gamestat|
  json.extract! gamestat, :id, :player_id, :team_id, :match_id, :minutos, :puntos, :t2, :t2a, :t3, :t3a, :t1, :t1a, :rebotes, :rebotesoff, :assistencias, :robos, :tapones, :perdidas, :faltas, :faltasrecibidas, :valoracion
  json.url gamestat_url(gamestat, format: :json)
end
