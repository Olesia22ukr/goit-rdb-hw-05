-- Task 1
SELECT
    od.*,
    (
        SELECT o.customer_id
        FROM orders o
        WHERE o.id = od.order_id
    ) AS customer_id
FROM
    order_details od;

-- Task 2
SELECT *
FROM order_details od
WHERE od.order_id IN (
    SELECT o.id
    FROM orders o
    WHERE o.shipper_id = 3
);
