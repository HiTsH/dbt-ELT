with orders as (select * from {{ ref("raw_orders") }})

select orderid, ordersellingprice
from orders
where ordersellingprice < 0
