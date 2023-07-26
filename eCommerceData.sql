WITH eCommerceData AS (
    -- Sample data
    SELECT 
        TIMESTAMP("2023-01-15") as purchase_date, "Electronics" as category, 299.99 as amount UNION ALL
    SELECT TIMESTAMP("2023-01-16"), "Books", 15.99 UNION ALL
    SELECT TIMESTAMP("2023-01-20"), "Electronics", 499.99 UNION ALL
    SELECT TIMESTAMP("2023-02-01"), "Books", 9.99 UNION ALL
    SELECT TIMESTAMP("2023-02-05"), "Apparel", 49.99 UNION ALL
    SELECT TIMESTAMP("2023-02-10"), "Apparel", 29.99
)

-- Main Query to calculate monthly metrics
SELECT 
    FORMAT_TIMESTAMP("%Y-%m", purchase_date) as month,
    category,
    COUNT(*) as total_purchases,
    ROUND(SUM(amount), 2) as monthly_revenue,
    ROUND(AVG(amount), 2) as avg_transaction_value
FROM
    eCommerceData
GROUP BY
    month, category
ORDER BY
    month, monthly_revenue DESC;
