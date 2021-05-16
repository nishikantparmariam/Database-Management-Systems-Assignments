SELECT 
  player.player_name as bowler_name, 
  bowler_id_and_run_info.total_runs as runs_scored 
FROM 
  player 
  INNER JOIN (
    SELECT 
      * 
    FROM 
      (
        SELECT 
          total_runs_table.*, 
          MIN(total_runs_table.total_runs) OVER () as min_runs 
        FROM 
          (
            SELECT 
              ball_by_ball.match_id, 
              ball_by_ball.over_id, 
              ball_by_ball.innings_no, 
              ball_by_ball.bowler, 
              SUM(
                IFNULL(batsman_scored.runs_scored, 0) + IFNULL(
                  extra_runs_filtered.extra_runs, 
                  0
                )
              ) as total_runs 
            FROM 
              ball_by_ball 
              LEFT OUTER JOIN batsman_scored ON (
                ball_by_ball.match_id = batsman_scored.match_id 
                AND ball_by_ball.over_id = batsman_scored.over_id 
                AND ball_by_ball.innings_no = batsman_scored.innings_no 
                AND ball_by_ball.ball_id = batsman_scored.ball_id
              ) 
              LEFT OUTER JOIN (
                SELECT 
                  * 
                FROM 
                  extra_runs 
                WHERE 
                  (
                    extra_type = 'wides' 
                    OR extra_type = 'noballs'
                  )
              ) as extra_runs_filtered ON (
                ball_by_ball.match_id = extra_runs_filtered.match_id 
                AND ball_by_ball.over_id = extra_runs_filtered.over_id 
                AND ball_by_ball.innings_no = extra_runs_filtered.innings_no 
                AND ball_by_ball.ball_id = extra_runs_filtered.ball_id
              ) 
            GROUP BY 
              ball_by_ball.match_id, 
              ball_by_ball.over_id, 
              ball_by_ball.innings_no, 
              ball_by_ball.bowler
          ) as total_runs_table
      ) as total_runs_with_min_runs 
    WHERE 
      total_runs_with_min_runs.total_runs = total_runs_with_min_runs.min_runs
  ) as bowler_id_and_run_info ON player.player_id = bowler_id_and_run_info.bowler 
ORDER BY 
  bowler_id_and_run_info.match_id ASC, 
  bowler_id_and_run_info.innings_no ASC, 
  bowler_id_and_run_info.over_id ASC;
