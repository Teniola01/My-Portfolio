--Retrieve all person.person data
Select * 
from person.Person
go

--Contact that does which to receive e-mail promotion from Adventurework and selected partner
Select*
from Person.Person
Where EmailPromotion =2 and   ModifiedDate>='2010'and ModifiedDate <='2013'
order by ModifiedDate asc;
go

--Total individual/retail customers not intrested in EmailPromotion(0)
Select count(*) as Not_intrested
From person.Person
where PersonType='in' and EmailPromotion=0
go


--Total number of purchase order details recorded in Purchasing.PurchaseOrderDetail table
SELECT COUNT(*) AS TotalOrderDetails
FROM Purchasing.PurchaseOrderDetail;
go

 --Sum of OrderQty (order quantity) for a specific ProductID.
 SELECT ProductID, SUM(OrderQty) AS TotalOrderQuantity
FROM Purchasing.PurchaseOrderDetail
WHERE ProductID =513
GROUP BY ProductID;
go
--Retrieve the PurchaseOrderID and ProductID for all rows where the OrderQty is greater than 100 in the
SELECT PurchaseOrderID, ProductID, OrderQty
FROM Purchasing.PurchaseOrderDetail
WHERE OrderQty > 100
Order by OrderQty asc;
go

--Update OrderQty to 150 for a specific PurchaseOrderDetailID.
UPDATE Purchasing.PurchaseOrderDetail
SET OrderQty = 150
WHERE PurchaseOrderDetailID = 4011;

--Average OrderQty for each PurchaseOrderID in the Purchasing.PurchaseOrderDetail table.
SELECT PurchaseOrderID, AVG(OrderQty) AS AverageOrderQuantity
FROM Purchasing.PurchaseOrderDetail
GROUP BY PurchaseOrderID;
go

--Total cost for each PurchaseOrderID and cost is stored in a column named LineTotal.
SELECT PurchaseOrderID, SUM(LineTotal) AS TotalCost
FROM Purchasing.PurchaseOrderDetail
GROUP BY PurchaseOrderID;


--Delete purchase order details where OrderQty is zero
DELETE FROM Purchasing.PurchaseOrderDetail
WHERE OrderQty = 0;

--Top 7 row
Select Top 7 * from
Purchasing.PurchaseOrderDetail;

--Distinct ProductID
Select distinct productID
From Purchasing.PurchaseOrderDetail;

-- Joining Purchasing.PurchaseOrderDetail table with another table named Purchasing.PurchaseOrderHeader on 
--PurchaseOrderID and select relevant columns from both tables

SELECT d.PurchaseOrderID, d.ProductID, d.OrderQty, h.OrderDate, h.VendorID
FROM Purchasing.PurchaseOrderDetail d
JOIN Purchasing.PurchaseOrderHeader h ON d.PurchaseOrderID = h.PurchaseOrderID;

--INNER JOIN on the Purchasing.PurchaseOrderDetail and Purchasing.PurchaseOrderHeader
SELECT 
    POD.*,
    POH.*
FROM 
    Purchasing.PurchaseOrderDetail AS POD
INNER JOIN 
    Purchasing.PurchaseOrderHeader AS POH
ON 
    POD.PurchaseOrderID = POH.PurchaseOrderID;

--LEFT JOIN between the Purchasing.PurchaseOrderDetail and Purchasing.PurchaseOrderHeader

SELECT  
    POD.*,
    POH.*
FROM 
    Purchasing.PurchaseOrderDetail AS POD
LEFT JOIN 
    Purchasing.PurchaseOrderHeader AS POH
ON 
    POD.PurchaseOrderID = POH.PurchaseOrderID;