use car;

-- Displayng whole data
select * from sales_data;

-- Displaying sales data by year
select 
    Year as Year,
    count(*) as Sales_by_Year,
    concat('$', format(sum(Sale_Price), 0)) as Total_Sale,
    concat('$', format(round(avg(Sale_Price), 0), 0)) as Avg_Sale_Price
from sales_data
group by Year
order by Year asc;

-- Displaying sales data by month
select
    Month_ID as ID,
    Month as Month,
    count(*) as Sale_by_Month,
    concat('$', format(sum(Sale_Price), 0)) as Total_Sale,
    concat('$', format(round(avg(Sale_Price), 0), 0)) as Avg_Sale_Price
from sales_data
group by Month_ID, Month
order by Month_ID asc;

-- Displaying sales data by day
select
    Day_ID as ID,
    Day as Day,
    count(*) as Sale_by_Day,
    concat('$', format(sum(Sale_Price), 0)) as Total_Sale,
    concat('$', format(round(avg(Sale_Price), 0), 0)) as Avg_Sale_Price
from sales_data
group by Day_ID, Day 
order by Day_ID asc;

-- Displaying sales data by car making year
select
    Car_Year as Car_Year,
    count(*) as Sale_by_Making_Year,
    concat('$', format(sum(Sale_Price), 0)) as Total_Sale,
    concat('$', format(round(avg(Sale_Price), 0), 0)) as Avg_Sale_Price
from sales_data
group by Car_Year
order by Car_Year asc;

-- Displaying sales data by car company
select
    Car_Make as Company,
    count(*) as Sale_by_Company,
    concat('$', format(sum(Sale_Price), 0)) as Total_Sale,
    concat('$', format(round(avg(Sale_Price), 0), 0)) as Avg_Sale_Price
from sales_data
group by Company
order by Sale_by_Company desc;

-- Displaying sales data by company and model
select 
    Car_Make as Company,
    Car_Model as Model,
    count(*) as Sale_Each_Company_by_Model,
    concat('$', format(sum(Sale_Price), 0)) as Total_Sale,
    concat('$', format(round(avg(Sale_Price), 0), 0)) as Avg_Sale_Price
from sales_data
group by Car_Make, Car_Model
order by Car_Make asc, Sale_Each_Company_by_Model desc;

-- Displaying salesperson performance metrics
select 
    row_number() over(order by count(*) desc) as ID,
    Sales_Person as Seller,
    count(*) as Count_Sale,
    concat('$', format(sum(Sale_Price), 0)) as Total_Sale,
    concat('$', format(round(avg(Sale_Price), 0), 0)) as Avg_Sale_Price,
    concat('$', format(max(Sale_Price), 0)) as Max_Sale_Price,
    concat('$', format(min(Sale_Price), 0)) as Min_Sale_Price,
    concat('$', format(round(avg(Sale_Price), 0), 0)) as Avg_Each_Sale_Price,
    concat('$', format(sum(Commission_Earned), 0)) as Total_Profit,
    concat('$', format(round(avg(Commission_Earned), 0), 0)) as Avg_Profit_by_Sale,
    concat('$', format(max(Commission_Earned), 0)) as Max_Profit_by_Sale,
    concat('$', format(min(Commission_Earned), 0)) as Min_Profit_by_Sale
from sales_data
group by Seller
having sum(Sale_Price) >= 1000000
order by ID asc;

-- Displaying top customers based on purchase amount
select
    row_number() over(order by count(*) desc) as ID,
    Customer_Name as Customer,
    count(*) as Count_Purchase,
    concat('$', format(sum(Sale_Price), 0)) as Total_Money_Spend,
    concat('$', format(round(avg(Sale_Price), 0), 0)) as Avg_Money_Spend,
    concat('$', format(max(Sale_Price), 0)) as Max_Money_Spend,
    concat('$', format(min(Sale_Price), 0)) as Min_Money_Spend
from sales_data
group by Customer
having sum(Sale_Price) >= 1000000
order by ID asc;
