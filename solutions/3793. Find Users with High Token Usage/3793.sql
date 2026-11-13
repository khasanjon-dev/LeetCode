WITH prompts_filtered AS (SELECT user_id,
                                 COUNT(*)              AS prompt_count,
                                 ROUND(AVG(tokens), 2) AS avg_tokens
                          FROM prompts
                          GROUP BY user_id
                          HAVING COUNT(*) >= 3)

SELECT *
FROM (SELECT DISTINCT ON (p.user_id) p.user_id,
                                     pf.prompt_count,
                                     pf.avg_tokens
      FROM prompts p
               JOIN prompts_filtered pf
                    ON p.user_id = pf.user_id
      WHERE p.tokens > pf.avg_tokens
      ORDER BY p.user_id ASC) AS result
ORDER BY avg_tokens DESC, user_id ASC;