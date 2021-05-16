SELECT  
  player.player_name as bowler_name, 
  final_bowler_ids_and_min_average.bowler_average as average
FROM 
  player 
  INNER JOIN (
    SELECT 
      bowler_average_min_info.bowler as bowler, 
      bowler_average_min_info.bowler_average as bowler_average 
    FROM 
      (
        SELECT 
          ball_bowler_run_wicket_info.bowler, 
          (
            SUM(
              ball_bowler_run_wicket_info.total_runs
            ) / SUM(
              ball_bowler_run_wicket_info.was_wicket
            )
          ) as bowler_average, 
          (
            MIN(
              (
                SUM(
                  ball_bowler_run_wicket_info.total_runs
                ) / SUM(
                  ball_bowler_run_wicket_info.was_wicket
                )
              )
            ) OVER ()
          ) as min_bowler_average 
        FROM 
          (
            SELECT 
              ball_by_ball.match_id, 
              ball_by_ball.over_id, 
              ball_by_ball.ball_id, 
              ball_by_ball.innings_no, 
              ball_by_ball.bowler, 
              (
                IFNULL(batsman_scored.runs_scored, 0) + IFNULL(extra_runs.extra_runs, 0)
              ) as total_runs, 
              IF(
                wicket_taken.kind_out IS NULL, 0, 1
              ) as was_wicket 
            FROM 
              ball_by_ball 
              LEFT OUTER JOIN batsman_scored ON (
                ball_by_ball.match_id = batsman_scored.match_id 
                AND ball_by_ball.over_id = batsman_scored.over_id 
                AND ball_by_ball.ball_id = batsman_scored.ball_id 
                AND ball_by_ball.innings_no = batsman_scored.innings_no
              ) 
              LEFT OUTER JOIN extra_runs ON (
                ball_by_ball.match_id = extra_runs.match_id 
                AND ball_by_ball.over_id = extra_runs.over_id 
                AND ball_by_ball.ball_id = extra_runs.ball_id 
                AND ball_by_ball.innings_no = extra_runs.innings_no
              ) 
              LEFT OUTER JOIN (
                SELECT 
                  * 
                FROM 
                  wicket_taken 
                WHERE 
                  wicket_taken.kind_out IN (
                    'bowled', 'caught', 'lbw', 'caught and bowled', 
                    'stumped'
                  )
              ) as wicket_taken ON (
                ball_by_ball.match_id = wicket_taken.match_id 
                AND ball_by_ball.over_id = wicket_taken.over_id 
                AND ball_by_ball.ball_id = wicket_taken.ball_id 
                AND ball_by_ball.innings_no = wicket_taken.innings_no
              ) 
              INNER JOIN `match` ON (
                ball_by_ball.match_id = match.match_id
              ) 
            WHERE 
              match.season_id = 5
          ) as ball_bowler_run_wicket_info 
        GROUP BY 
          ball_bowler_run_wicket_info.bowler 
        HAVING 
          (bowler_average IS NOT NULL)
      ) as bowler_average_min_info 
    WHERE 
      bowler_average_min_info.bowler_average = bowler_average_min_info.min_bowler_average
  ) as final_bowler_ids_and_min_average ON player.player_id = final_bowler_ids_and_min_average.bowler 
ORDER BY 
  player.player_name DESC;
