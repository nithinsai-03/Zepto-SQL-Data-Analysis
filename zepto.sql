DROP table if exists zepto;

CREATE table zepto(
sku_id SERIAL PRIMARY KEY,
Category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN, 
quantity INTEGER
)

-- data exploration

SELECT count(*) from zepto


select * from zepto
LIMIT 10

-- select * from zepto;


-- null values

select * from zepto 
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountpercent IS NULL
OR
availablequantity IS NULL
OR
discountedsellingprice IS NULL
OR
weightingms IS NULL
OR
outofstock IS NULL
OR
quantity IS NULL



--product categories in data

SELECT distinct category
from zepto
order by category

--instock vs outof stock


SELECT * FROM zepto
LIMIT 10


SELECT outofstock ,COUNT(sku_id)
FROM zepto
GROUP BY outofstock


---product names which are present multiple times
SELECT name ,count(sku_id) as "no_of_SKUs"
FROM zepto
GROUP BY name
HAVING COUNT(sku_id)>5
ORDER BY COUNT(sku_id) DESC


---date cleaning

--product price is zero

SELECT * FROM zepto

WHERE mrp = 0 OR discountedSellingPrice=0;

DELETE FROM zepto WHERE mrp=0

SELECT count(*) from zepto



--converting price and discountedprice from paisa into rupees 


UPDATE zepto
SET mrp=mrp/100.0,
discountedSellingPrice=discountedSellingPrice/100.0

SELECT mrp ,discountedSellingPrice FROM zepto



--1 . top 10 best - value products based on discount percentage

SELECT distinct name , mrp , discountPercent
FROM zepto
ORDER by discountPercent DESC
LIMIT 10



--2. what are the products with high mrp but out of stock

SELECT DISTINCT name , mrp , outOfStock
FROM zepto 
WHERE outOfStock = true AND mrp >300
ORDER BY mrp DESC

select * from zepto
limit 10

--3 . caluculate the estimated revenue for each category
SELECT Category,
SUM(discountedsellingprice * availablequantity ) AS total_revenue
FROM zepto
GROUP BY category 
ORDER BY total_revenue

--4. find products where mrp >500 and discount is < 10%


SELECT  name , mrp , discountPercent 
FROM zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC , discountPercent



-- 5. Identify the top 5 categories offering the highest average discount percent

SELECT category,
ROUND(AVG(discountPercent),2) AS discount_percent
FROM zepto 
GROUP BY category 
ORDER BY discount_percent DESC
LIMIT 5


-- 6. find the price per gram for products above 100g and sort by best value

SELECT DISTINCT name , discountedSellingPrice , weightInGms,
ROUND(discountedSellingPrice/weightInGms,2) as price_per_gram
FROM zepto 
WHERE weightInGms >=100
ORDER BY price_per_gram DESC


--7 . group the product into categories into low, medium, bulk
SELECT name , weightInGms,
CASE WHEN weightInGms <1000 THEN 'LOW'
WHEN weightInGms <5000 THEN 'MEDIUM'
ELSE 'HIGH'
END AS weight_division
FROM zepto 
ORDER BY weight_division



--8. what is the total inventory weight per category 


SELECT category,
SUM (weightInGms+availableQuantity) as category_weight
FROM zepto
GROUP BY category
ORDER BY category_weight DESC