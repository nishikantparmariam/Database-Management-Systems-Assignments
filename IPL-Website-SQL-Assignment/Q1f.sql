SELECT 
  * 
FROM 
  (
    SELECT 
      player.player_name as batsman_name, 
      value_info.value 
    FROM 
      player 
      INNER JOIN (
        SELECT 
          runs_scored_by_striker_matchwise.striker, 
          AVG(
            runs_scored_by_striker_matchwise.runs_scored
          ) as `value` 
        FROM 
          (
            SELECT 
              ball_by_ball.match_id, 
              ball_by_ball.striker, 
              SUM(
                IFNULL(batsman_scored.runs_scored, 0)
              ) as runs_scored 
            FROM 
              ball_by_ball 
              LEFT OUTER JOIN batsman_scored ON (
                ball_by_ball.match_id = batsman_scored.match_id 
                AND ball_by_ball.over_id = batsman_scored.over_id 
                AND ball_by_ball.ball_id = batsman_scored.ball_id 
                AND ball_by_ball.innings_no = batsman_scored.innings_no
              ) 
              INNER JOIN `match` ON match.match_id = ball_by_ball.match_id 
            WHERE 
              match.season_id = 2 
            GROUP BY 
              ball_by_ball.match_id, 
              ball_by_ball.striker
          ) as runs_scored_by_striker_matchwise 
        GROUP BY 
          runs_scored_by_striker_matchwise.striker
      ) as value_info ON player.player_id = value_info.striker 
    ORDER BY 
      value_info.value DESC 
    LIMIT 
      3
  ) as top_player_info 
ORDER BY 
  top_player_info.batsman_name ASC;
