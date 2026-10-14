-- Quantos pedidos existem?
SELECT COUNT(*) AS total_pedidos FROM orders;

-- Quais os status de pedido e quantos há de cada?
SELECT order_status, COUNT(*) AS total
FROM orders
GROUP BY order_status
ORDER BY total DESC;

-- Qual o período coberto pelos dados?
SELECT MIN(order_purchase_timestamp) AS primeira_compra,
       MAX(order_purchase_timestamp) AS ultima_compra
FROM orders;

-- Quantos pedidos entregues estão sem data de entrega?
SELECT COUNT(*) AS entregues_sem_data
FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NULL;