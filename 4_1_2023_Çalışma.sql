BEGIN TRANSACTION
BEGIN TRY
--1.Order tablosuna yeni bir kay�t ekleme
INSERT INTO dbo.Orders(CustomerID,EmployeeID,ShipAddress,ShipCity,ShipCountry)
VALUES ('ALFKI',1,'Istanbul Mah.No:1', 'Istanbul','Turkey')
--Order tablosundan eklenen son OrderID'in de�i�kene atanmas�
DECLARE @OrderID int 
SET @OrderID=@@IDENTITY;
--2.OrderDetail tablosuna,son OrderID ile yeni bir kay�t ekleme
INSERT INTO dbo.[Order Details](OrderID,ProductID,UnitPrice,Quantity,Discount)
VALUES (@OrderID,5,22.00,5,0);
--E�er i�lemler ba�ar�s�z olursa ROLLBACK ile geri al
COMMIT TRANSACTION;
END TRY
BEGIN CATCH
PRINT 'Sipari� ba�ar�yla tamamlanamad�';
ROLLBACK TRANSACTION;
END CATCH

