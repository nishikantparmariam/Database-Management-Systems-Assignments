SELECT 
  match_info_with_legbyes_and_max.venue as venue_name, 
  match_info_with_legbyes_and_max.number_of_legbye_runs as number_of_legbye_runs 
FROM 
  (
    SELECT 
      match_info_with_legbyes.venue, 
      SUM(
        match_info_with_legbyes.number_of_legbye_runs
      ) as number_of_legbye_runs, 
      MAX(
        SUM(
          match_info_with_legbyes.number_of_legbye_runs
        )
      ) OVER () as max_number_of_legbye_runs 
    FROM 
      (
        SELECT 
          `match`.*, 
          IFNULL(
            match_with_legbyes_run_info.number_of_legbye_runs, 
            0
          ) as number_of_legbye_runs 
        FROM 
          `match` 
          LEFT OUTER JOIN (
            SELECT 
              match_id, 
              SUM(extra_runs) as number_of_legbye_runs 
            FROM 
              extra_runs 
            WHERE 
              extra_type = 'legbyes' 
            GROUP BY 
              match_id
          ) as match_with_legbyes_run_info ON match.match_id = match_with_legbyes_run_info.match_id
      ) as match_info_with_legbyes 
    GROUP BY 
      match_info_with_legbyes.venue
  ) as match_info_with_legbyes_and_max 
WHERE 
  match_info_with_legbyes_and_max.number_of_legbye_runs = match_info_with_legbyes_and_max.max_number_of_legbye_runs 
ORDER BY 
  match_info_with_legbyes_and_max.venue ASC;
