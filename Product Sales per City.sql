//For each pair of city and product, return the names of the city and product, as well the total amount spent on the product to 2 decimal places. Order the result by the amount spent from high to low then by city name and product name in ascending order.

SELECT ci.city_name, pr.product_name, ROUND(SUM(ii.line_total_price), 
2) AS tot
FROM city ci, customer cu, invoice i, invoice_item ii, product pr 
WHERE ci.id = cu.city_id AND cu.id = i.customer_id AND i.id = ii.
invoice_id AND ii.product_id = pr.id 
GROUP BY ci.city_name, pr.product_name 
ORDER BY tot DESC, ci.city_name, pr.product_name 
