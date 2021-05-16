SELECT 
  player.player_name as `name`, 
  required_captains.runs as runs 
FROM 
  player 
  INNER JOIN (
    SELECT 
      all_captain_match_info.player_id, 
      SUM(
        match_striker_runs_scored.runs_scored
      ) as runs 
    FROM 
      (
        SELECT 
          match_id, 
          player_id 
        FROM 
          player_match 
        WHERE 
          role = 'Captain' OR role = 'CaptainKeeper'
      ) as all_captain_match_info 
      INNER JOIN (
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
          match.season_id = 3 
        GROUP BY 
          ball_by_ball.match_id, 
          ball_by_ball.striker
      ) as match_striker_runs_scored ON (
        match_striker_runs_scored.match_id = all_captain_match_info.match_id 
        AND match_striker_runs_scored.striker = all_captain_match_info.player_id
      ) 
    GROUP BY 
      all_captain_match_info.player_id 
    HAVING 
      runs > 50
  ) as required_captains ON player.player_id = required_captains.player_id ORDER BY name ASC;
