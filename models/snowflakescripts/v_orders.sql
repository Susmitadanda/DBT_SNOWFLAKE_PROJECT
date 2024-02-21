
-- Use the `ref` function to select from other models-

SELECT 
    o.Order_ID,
    c.Customer_ID,
    c.Customer_Name,
    p.Product_ID,
    p.Product_Name,
    o.Quantity,
    o.Order_Date
FROM
    raw_data.orders o
JOIN
    {{ ref("v_customers") }} c ON o.Customer_ID = c.Customer_ID
JOIN
    raw_data.products p ON o.Product_ID = p.Product_ID