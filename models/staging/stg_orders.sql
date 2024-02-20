select
-- from dbt_utils package // generate_surrogate_key()
{{ dbt_utils.generate_surrogate_key(['o.orderid', 'c.customerid','p.productid']) }} as SK_orders,
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
p.subcategory,
{{ markup('ordersellingprice', 'ordercostprice') }} as markup,
d.delivery_team
from {{ ref('raw_orders') }} as o
join {{ ref('raw_customers') }} as c
on o.customerid = c.customerid
join {{ ref('raw_products') }} as p
on o.productid = p.productid
join {{ ref('delivery_team') }} as d
on o.shipmode = d.shipmode

{{ limit_data_in_dev('orderdate')}}