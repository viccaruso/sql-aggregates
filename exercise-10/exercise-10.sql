-- CUBE of amount made per year, month, day, and film rating
-- similar to exercise 9 but include the rating with joins
-- replace ROLLUP with CUBE
SELECT
  rating,
  EXTRACT (
    YEAR
    FROM
      payment_date
  ) y,
  EXTRACT (
    MONTH
    FROM
      payment_date
  ) m,
  EXTRACT (
    DAY
    FROM
      payment_date
  ) d,
  SUM(amount)
FROM
  payment
  INNER JOIN rental ON rental.rental_id = payment.rental_id
  INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
  INNER JOIN film ON film.film_id = inventory.film_id
GROUP BY
  CUBE (rating, y, m, d)
ORDER BY
	rating, y, m, d