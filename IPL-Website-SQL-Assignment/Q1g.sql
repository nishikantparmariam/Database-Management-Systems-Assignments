/*
    For a player, 
    batting_average = runs_scored_in_all_matches / number_of_matches_played

    if number_of_matches_played = 0 then batting_average = 0
*/


SELECT 
  player_info_with_batting_average.country_name as country, 
  AVG(
    player_info_with_batting_average.batting_average_player
  ) as `value` 
FROM 
  (
    SELECT 
      player.*, 
      IFNULL(
        batting_average_info.batting_average, 
        0
      ) as batting_average_player 
    FROM 
      player 
      LEFT OUTER JOIN (
        SELECT 
          AVG(
            run_info_per_match.runs_scored_in_a_match
          ) as batting_average, 
          run_info_per_match.striker 
        FROM 
          (
            SELECT 
              ball_by_ball.match_id, 
              ball_by_ball.striker, 
              SUM(batsman_scored.runs_scored) as runs_scored_in_a_match 
            FROM 
              ball_by_ball 
              INNER JOIN batsman_scored ON (
                ball_by_ball.match_id = batsman_scored.match_id 
                AND ball_by_ball.over_id = batsman_scored.over_id 
                AND ball_by_ball.ball_id = batsman_scored.ball_id 
                AND ball_by_ball.innings_no = batsman_scored.innings_no
              ) 
            GROUP BY 
              ball_by_ball.match_id, 
              ball_by_ball.striker
          ) as run_info_per_match 
        GROUP BY 
          run_info_per_match.striker
      ) as batting_average_info ON (
        player.player_id = batting_average_info.striker
      )
  ) as player_info_with_batting_average 
GROUP BY 
  player_info_with_batting_average.country_name 
ORDER BY 
  `value` DESC 
LIMIT 
  3;
