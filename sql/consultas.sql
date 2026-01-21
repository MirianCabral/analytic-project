--Faturamento mensal
SELECT
    purchase_year_month,
    SUM(receita_item) AS faturamento
FROM fato_vendas
GROUP BY purchase_year_month
ORDER BY purchase_year_month;


--Faturamento Total
SELECT
    SUM(receita_item) AS faturamento_total
FROM fato_vendas;

--Ticket médio
SELECT
    SUM(receita_item) / COUNT(DISTINCT order_id) AS ticket_medio
FROM fato_vendas;

--Receita Total por estado
SELECT
    customer_state,
    SUM(receita_item) AS receita_estado
FROM fato_vendas
GROUP BY customer_state
ORDER BY customer_state;

--Ticket médio por estado
SELECT
    customer_state,
    SUM(receita_item) AS receita_estado,
    SUM (receita_item) / COUNT(DISTINCT order_id) as ticket_medio_estado
FROM fato_vendas
GROUP BY customer_state
ORDER BY ticket_medio_estado DESC

--Maior Receita por categoria
SELECT
    product_category_name,
    SUM(receita_item) as receita_categoria
FROM fato_vendas
GROUP BY product_category_name
ORDER BY receita_categoria DESC

--% de pedidos atradados por Mês
SELECT
    purchase_year_month,
    COUNT(DISTINCT order_id) AS total_pedidos,
    COUNT(DISTINCT CASE WHEN delivery_delay = True THEN order_id END) AS pedidos_atrasados,
    COUNT(DISTINCT CASE WHEN delivery_delay = True THEN order_id END) * 100 / COUNT(DISTINCT order_id) AS percentual_atraso
FROM fato_vendas
GROUP BY purchase_year_month
ORDER BY purchase_year_month

--Tempo médio de entrega por categoria
SELECT
    product_category_name,
    AVG(delivery_time_days) AS tempo_medio_entrega
FROM fato_vendas
WHERE delivery_time_days IS NOT NULL
GROUP BY product_category_name
ORDER BY product_category_name