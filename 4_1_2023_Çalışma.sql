BEGIN TRANSACTION
BEGIN TRY
--1.Order tablosuna yeni bir kayýt ekleme
INSERT INTO dbo.Orders(CustomerID,EmployeeID,ShipAddress,ShipCity,ShipCountry)
VALUES ('ALFKI',1,'Istanbul Mah.No:1', 'Istanbul','Turkey')
--Order tablosundan eklenen son OrderID'in deðiþkene atanmasý
DECLARE @OrderID int 
SET @OrderID=@@IDENTITY;
--2.OrderDetail tablosuna,son OrderID ile yeni bir kayýt ekleme
INSERT INTO dbo.[Order Details](OrderID,ProductID,UnitPrice,Quantity,Discount)
VALUES (@OrderID,5,22.00,5,0);
--Eðer iþlemler baþarýsýz olursa ROLLBACK ile geri al
COMMIT TRANSACTION;
END TRY
BEGIN CATCH
PRINT 'Sipariþ baþarýyla tamamlanamadý';
ROLLBACK TRANSACTION;
END CATCH

