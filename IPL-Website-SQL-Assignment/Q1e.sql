SELECT 
  player_name as batsmen_name, 
  runs_scored as runs 
FROM 
  player 
  INNER JOIN (
    SELECT 
      multiple_entries.striker, 
      MAX(multiple_entries.runs_scored) as runs_scored 
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
        GROUP BY 
          ball_by_ball.match_id, 
          ball_by_ball.striker 
        HAVING 
          runs_scored > 100
      ) as multiple_entries 
    GROUP BY 
      multiple_entries.striker
  ) as striker_run_info ON (
    striker_run_info.striker = player.player_id
  ) 
ORDER BY 
  player_name ASC;
