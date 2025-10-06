# 🛒 Zepto Inventory Data Analysis

This project focuses on **analyzing and exploring Zepto’s inventory dataset** using **SQL (PostgreSQL)** to derive actionable business insights.  
The dataset was sourced from [Kaggle - Zepto Inventory Dataset](https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset/data?select=zepto_v2.csv).

---

## 📊 Project Overview

The goal of this project was to:
- Clean and validate raw inventory data  
- Perform exploratory data analysis (EDA) using SQL queries  
- Compute key performance indicators (KPIs)  
- Derive insights into product performance, discount strategies, and inventory optimization  

---

## 📁 Dataset Information

- **Source:** Kaggle  
- **Rows:** 3,733  
- **Columns:** 9  
- **Key Fields:**  
  `sku_id`, `category`, `name`, `mrp`, `discountPercent`, `availableQuantity`, `discountedSellingPrice`, `weightInGms`, `outOfStock`

---

## 🧹 Data Cleaning Steps

- Removed rows with **missing or null values** in critical columns  
- Deleted products with **MRP or discountedSellingPrice = 0**  
- Converted **prices from paisa to rupees** for accurate calculations  
- Detected and reviewed **duplicate product entries (SKUs)**  
- Standardized and validated **category names** for consistency  

---

## 🧠 SQL Operations and Analysis

### 🔹 Key Performance Indicators (KPIs)

1. **Top 10 Best-Value Products** — based on highest discount percentage  
2. **High MRP but Out-of-Stock Products** — potential restocking opportunities  
3. **Category-wise Estimated Revenue** — calculated as `discountedSellingPrice * availableQuantity`  
4. **High MRP with Low Discount Products** — to identify premium product segments  
5. **Top 5 Categories by Average Discount Percent** — evaluates marketing and pricing efficiency  
6. **Price per Gram Analysis** — for products weighing above 100g  
7. **Weight Classification** — segmented as *Low*, *Medium*, *High* based on `weightInGms`  
8. **Total Inventory Weight per Category** — shows total product mass per category  

---

## 🧩 Tools and Technologies

- **Database:** PostgreSQL  
- **Language:** SQL  
- **Platform:** Local PostgreSQL Environment  
- **Techniques:** Data Cleaning, Aggregation, Grouping, Case-based Segmentation, and KPI Analysis  

---

## 📈 Insights and Findings

- Identified **top-performing product categories** and **best-value items**.  
- Discovered **high MRP products frequently out of stock**, indicating restocking gaps.  
- Analyzed **category-level revenue contribution** and **weight distribution**.  
- Segmented items into **Low, Medium, and High-weight** groups for better inventory planning.

---

## 🚀 How to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/zepto-inventory-analysis.git
   cd zepto-inventory-analysis
