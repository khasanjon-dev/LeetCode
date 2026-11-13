WITH borrowed_books AS (SELECT book_id,
                               COUNT(*) AS current_borrowers
                        FROM borrowing_records
                        WHERE return_date IS NULL
                        GROUP BY book_id)
SELECT bb.book_id,
       lb.title,
       lb.author,
       lb.genre,
       lb.publication_year,
       bb.current_borrowers
FROM library_books lb
         JOIN borrowed_books bb
              ON bb.book_id = lb.book_id
WHERE CAST(lb.total_copies - bb.current_borrowers AS INT) = 0
ORDER BY bb.current_borrowers DESC, lb.title ASC
;