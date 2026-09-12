
USE ecommerce;

SELECT * FROM orders LIMIT 5;

# QUERY 1: TOTAL BUSINESS PERFORMANCE
# Overall performance of business in terms of total orders and revenue

SELECT 
    COUNT(DISTINCT `ï»¿order_id`) AS Total_Orders,
    SUM(`Payment Value`) AS Total_Revenue
FROM orders;

# QUERY 2: AVERAGE ORDER VALUE
# Shows how much revenue is generated per order on average
SELECT 
    SUM(`Payment Value`) / COUNT(DISTINCT `ï»¿order_id`) AS Avg_Order_Value
FROM orders;

# QUERY 3: REVENUE BY CITY
# Business Insight:
# Identifies top-performing cities contributing highest revenue
SELECT 
    City,
    SUM(`Payment Value`) AS Revenue
FROM orders
GROUP BY City
ORDER BY Revenue DESC;


# ============================================
# QUERY 4: TOP 5 CITIES BY ORDERS
# Business Insight:
# Highlights cities with highest demand (order volume)
SELECT 
    City,
    COUNT(DISTINCT `ï»¿order_id`) AS Total_Orders
FROM orders
GROUP BY City
ORDER BY Total_Orders DESC
LIMIT 5;

# QUERY 5: MONTHLY REVENUE TREND
# Helps identify seasonal trends and peak sales months
SELECT 
    Year,
    Month,
    SUM(`Payment Value`) AS Monthly_Revenue
FROM orders
GROUP BY Year, Month
ORDER BY Year, Month;

# QUERY 6: TOP 5 PRODUCTS BY SALES
# Business Insight:
# Identifies best-selling products based on sales value
SELECT 
    Product_id,
    SUM(`Product price`) AS Total_Sales
FROM orders
GROUP BY Product_id
ORDER BY Total_Sales DESC
LIMIT 5;

# QUERY 7: SALES BY PRODUCT CATEGORY
# Shows which product categories generate the most revenue
SELECT 
    Product_category,
    SUM(`Product price`) AS Sales
FROM orders
GROUP BY Product_category
ORDER BY Sales DESC;

# QUERY 8: TOP 5 CATEGORIES BY REVENUE
# Identifies most profitable product categories
SELECT 
    Product_category,
    SUM(`Payment Value`) AS Revenue
FROM orders
GROUP BY Product_category
ORDER BY Revenue DESC
LIMIT 5;

# QUERY 9: ORDER STATUS DISTRIBUTION
# Shows operational performance (delivered, cancelled, etc.)
SELECT 
    order_status,
    COUNT(`ï»¿order_id`) AS Total_Orders
FROM orders
GROUP BY order_status;


# QUERY 10: DELIVERY PERFORMANCE
# Measures average delivery time to evaluate logistics efficiency
SELECT 
    AVG(`No of days`) AS Avg_Delivery_Time
FROM orders;

# QUERY 11: CUSTOMER SATISFACTION SCORE
# Measures overall customer satisfaction using average review score
SELECT 
    AVG(review_score) AS Avg_Review_Score
FROM reviews;

# QUERY 12: CUSTOMER SATISFACTION SEGMENTATION
# Classifies customers into Good vs Bad based on ratings
SELECT 
    CASE 
        WHEN review_score >= 4 THEN 'Good'
        ELSE 'Bad'
    END AS Rating_Category,
    COUNT(*) AS Total_Orders
FROM reviews
GROUP BY Rating_Category;