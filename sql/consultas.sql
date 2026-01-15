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