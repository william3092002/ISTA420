-- Name: William Chan
use tsqlv4;




with T1 as
(select sum(od1.qty) as sumQty, od1.productid, year(o.orderdate) as yr, month(o.orderdate) as mon 
from sales.OrderDetails od1 inner join Sales.Orders o
on od1.orderid = o.orderid
group by od1.productid, year(o.orderdate), month(o.orderdate))
select t1.productid, datefromparts(yr, mon, 1) as monthyear, 
sumQty as thisMonth,
lag(sumqty) over(partition by productid order by yr, mon) as lastMonth,
(sumQty - lag(sumqty) over(partition by productid order by yr, mon)) as diff, 
convert(decimal(10, 2),100.0 * (sumQty - lag(sumqty) over(partition by productid order by yr, mon))
/lag(sumqty) over(partition by productid order by yr, mon) )
as pctIncDec,
SUM(sumQty) OVER(PARTITION BY productid
                ORDER BY yr, mon
                ROWS BETWEEN UNBOUNDED PRECEDING
                         AND CURRENT ROW) AS runval,
convert(decimal(10,2), 
(100.0 * sumQty/lag(sumqty) over(partition by productid order by yr, mon))) as pctChange,
sum(sumqty) over(partition by productid) as totalPerProduct,
convert(decimal(10,2), 
(100.0 * sumQty / sum(sumqty) over(partition by productid))) as pctLinePerProduct
from T1 order by productid, monthyear
						








with CTE as 
(select od.productid, sum(od.qty) as sumqty, year(o.orderdate) as yr, month(o.orderdate) as mth from sales.OrderDetails od join sales.orders o
on od.orderid = o.orderid group by productid, year(o.orderdate), month(o.orderdate))

select productid, datefromparts(yr,mth,1) as monthyear, sumqty as thisMonth,
lag(sumqty) over (partition by productid
order by yr, mth) as lastMonth, sumqty - lag(sumqty) over (partition by productid order by yr, mth) as diff,
convert(decimal(10,2), 100.0 * (sumqty - lag(sumqty) over (partition by productid order by yr, mth) * 1.0) /
convert(decimal(10,2), (lag(sumqty) over (partition by productid order by yr, mth) * 1.0 ))) as pctIncDec,
sum (sumqty) over (partition by productid order by yr, mth rows between unbounded preceding and current row) as running,
convert(decimal(10,2),100.0 * sumqty / lag(sumqty) over (partition by productid order by yr, mth)) as pctChange,
sum(sumqty) over (partition by productid) as totalPerProduct,
convert(decimal(10,2), 100.0 * sumqty / sum(sumqty) over (partition by productid)) as pctLinePerProduct
from CTE;  