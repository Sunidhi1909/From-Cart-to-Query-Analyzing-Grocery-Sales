Create database PurchasingPattern;
use PurchasingPattern;

select*from grocery_set;

SHOW COLUMNS FROM grocery_set;

##Top 10 Most Sold Items
SELECT itemDescription, COUNT(*) as Total_Sales
FROM grocery_set
GROUP BY itemDescription
ORDER BY Total_Sales DESC
LIMIT 10;

##Sales Trend Over Time:
SELECT DATE_FORMAT(Date, '%Y-%m') as Month, SUM(CASE WHEN itemDescription = 'whole milk' THEN 1 ELSE 0 END) as Whole_Milk_Sales,
    SUM(CASE WHEN itemDescription = 'tropical fruit' THEN 1 ELSE 0 END) as Tropical_Fruit_Sales
FROM grocery_set
GROUP BY Month
ORDER BY Month;

##Customer Segmentation:
SELECT Member_number, COUNT(*) as Total_Purchases,
    SUM(CASE WHEN itemDescription IN ('whole milk', 'yogurt', 'cheese') THEN 1 ELSE 0 END) as Dairy_Purchases,
    SUM(CASE WHEN itemDescription IN ('tropical fruit', 'citrus fruit', 'packaged fruit/veg') THEN 1 ELSE 0 END) as Fruit_Purchases
FROM grocery_set
GROUP BY Member_number
HAVING Total_Purchases > 10;

##Identifying Slow-Moving Items:
SELECT itemDescription, COUNT(*) as Total_Sales
FROM grocery_set
GROUP BY itemDescription
HAVING Total_Sales < 10;

##Analyzing Sales by Day of the Week:
SELECT DAYOFWEEK(Date) as Day_of_Week, COUNT(*) as Total_Sales
FROM grocery_set
GROUP BY Day_of_Week
ORDER BY Day_of_Week;