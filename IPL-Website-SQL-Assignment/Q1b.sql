SELECT 
  player_name, 
  IFNULL(
    player_id_with_frequency_of_caught_out.frequency_of_caught_out, 
    0
  ) as frequency_of_caught_out 
FROM 
  player 
  LEFT OUTER JOIN (
    SELECT 
      player_out, 
      COUNT(*) as frequency_of_caught_out 
    FROM 
      wicket_taken 
    WHERE 
      kind_out = 'caught' 
    GROUP BY 
      player_out
  ) as player_id_with_frequency_of_caught_out ON player.player_id = player_id_with_frequency_of_caught_out.player_out 
ORDER BY 
  frequency_of_caught_out ASC, 
  player_name ASC;
