select
-- from orders
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice - o.ordercostprice as orderprofit,
o.ordercostprice,
o.ordersellingprice,
-- from customers
c.customerid,
c.customername,
c.segment,
c.country,
-- from products
p.productid,
p.category,
p.productname,
p.subcategory
from {{ ref('raw_orders') }} as o
join {{ ref('raw_customers') }} as c
on o.customerid = c.customerid
join {{ ref('raw_products') }} as p
on o.productid = p.productid
