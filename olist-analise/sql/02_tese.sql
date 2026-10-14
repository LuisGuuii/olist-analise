-- Nota média de pedidos entregues no prazo vs. com atraso
SELECT
  CASE
    WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date
      THEN 'atrasado'
    ELSE 'no prazo'
  END AS situacao,
  COUNT(*) AS pedidos,
  ROUND(AVG(r.review_score), 2) AS nota_media
FROM orders o
JOIN order_reviews r ON r.order_id = o.order_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
GROUP BY situacao;