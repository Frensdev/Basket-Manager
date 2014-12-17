json.array!(@players) do |player|
  json.extract! player, :id, :team_id, :nombre, :apellido, :city, :nacimiento, :altura, :peso, :position, :shotins, :shotmed, :shotlong, :shotfree, :fuerza, :speed, :jump, :resist, :steal, :block, :pass, :reb, :mental, :teamwork, :potencial, :intensidad
  json.url player_url(player, format: :json)
end
