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

-- Task 3
SELECT
    temp.order_id,
    AVG(temp.quantity) AS avg_quantity
FROM
    (
        SELECT
            order_id,
            quantity
        FROM
            order_details
        WHERE
            quantity > 10
    ) AS temp
GROUP BY
    temp.order_id;

-- Task 4
WITH temp AS (
    SELECT
        order_id,
        quantity
    FROM
        order_details
    WHERE
        quantity > 10
)
SELECT
    order_id,
    AVG(quantity) AS avg_quantity
FROM
    temp
GROUP BY
    order_id;
-- Task 5
DROP FUNCTION IF EXISTS divide_values;

DELIMITER //
CREATE FUNCTION divide_values(a FLOAT, b FLOAT)
RETURNS FLOAT
DETERMINISTIC
NO SQL
BEGIN
    RETURN a / b;
END //
DELIMITER ;

SELECT
    id,
    order_id,
    product_id,
    quantity,
    divide_values(quantity, 2) AS divided_quantity
FROM order_details;
