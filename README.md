# Retail Business Performance Analytics

A retail business analytics project using SQL, Python, and Power BI to analyze sales performance, profitability, products, customers, and stores.

## Project Overview

This project analyzes retail sales data to understand revenue, profit, product performance, customer segments, and store performance using SQL, Python, and Power BI.

## Dataset

The dataset contains approximately 62,884 sales transaction records across multiple tables:

- Sales
- Customers
- Products
- Stores
- Exchange Rates

The data includes sales transactions, customer information, product details, store information, and exchange rates.

## Business Objectives

- Analyze overall revenue and profit performance
- Identify top-performing products and categories
- Understand customer revenue contribution
- Analyze store performance
- Identify important business trends
- Build an interactive Power BI dashboard for business decision-making

## Tools & Technologies

- SQL
- Python
- Pandas
- NumPy
- Power BI
- DAX

## SQL Analysis

The SQL analysis covers:

- Total revenue, cost, and profit
- Revenue and profit by year
- Monthly revenue trends
- Top products by revenue and profit
- Category-level revenue and profit
- Top customers by revenue
- Country-level revenue and profit

## Python Analysis

Python and Pandas were used for:

- Data loading and exploration
- Data cleaning and preprocessing
- Data analysis
- Grouping and aggregation
- Identifying patterns and trends in the data

## Power BI Dashboard

The dashboard contains two pages:

### 1. Executive Sales Overview

- KPI cards for Total Revenue, Total Profit, Profit Margin, Total Orders, and Total Customers
- Revenue & Profit by Year – tracks yearly business performance
- Profit Contribution by Category – identifies categories contributing most to profit
- Revenue by Country – shows geographic revenue distribution
- Key business insights

![Executive Sales Overview](Executive%20Sales%20Overview.png)

### 2. Product & Customer Insights

- Top 5 Products by Revenue – identifies highest-revenue products
- Revenue by Gender – compares customer revenue contribution
- Revenue by Customer Age Group – analyzes revenue across age segments
- Top 5 Stores by Revenue – highlights best-performing stores
- Top 3 Products by Category – identifies category-leading products

![Product & Customer Insights](Product%20%26%20Customer%20Insights.png)

## Key Business Insights

- 2019 recorded the highest full-year revenue and profit.
- Computers generated the highest profit contribution at approximately $11.3M.
- Total profit reached approximately $32.7M with a 58.58% profit margin.
- Customers aged 65+ generated the highest revenue at approximately $18.1M.
- Female customers contributed a higher share of revenue than male customers.
- Product performance varied across categories, with specific products emerging as category leaders.

## Project Structure

```text
Retail-Business-Performance-Analytics/
│
├── README.md
│
├── SQL/
│   └── maven_market_analytics.sql
│
├── Python/
│   └── Sales_data_analysis.ipynb
│
├── PowerBI/
│   └── Global_electronics_retailer.pbix
│
└── Screenshots/
    ├── Executive-Sales-Overview.png
    └── Product-Customer-Insights.png
