CREATE VIEW indian_players AS (
  SELECT 
    player.player_name as `name`, 
    IFNULL(
      all_players_runs.total_runs_scored, 
      0
    ) as runs 
  FROM 
    player 
    LEFT OUTER JOIN (
      SELECT 
        ball_by_ball.striker, 
        SUM(
          IFNULL(batsman_scored.runs_scored, 0)
        ) as total_runs_scored 
      FROM 
        ball_by_ball 
        LEFT OUTER JOIN batsman_scored ON (
          ball_by_ball.match_id = batsman_scored.match_id 
          AND ball_by_ball.over_id = batsman_scored.over_id 
          AND ball_by_ball.ball_id = batsman_scored.ball_id 
          AND ball_by_ball.innings_no = batsman_scored.innings_no
        ) 
      GROUP BY 
        ball_by_ball.striker
    ) as all_players_runs ON (
      player.player_id = all_players_runs.striker
    ) 
  WHERE 
    player.country_name = 'India' 
  ORDER BY 
    player.player_name
);


SELECT * FROM indian_players;



