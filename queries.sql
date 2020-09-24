-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT
    Product.Id,
    Product.ProductName,
    Product.CategoryId,
    Category.CategoryName,
    Category.Id
FROM
    Product
JOIN
    [Category] ON Product.CategoryId = Category.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT
    [Order].id,
    [Order].ShipVia,
    [Order].ShippedDate,
    [Shipper].CompanyName
FROM
    [Order]
JOIN
    [Shipper] ON Shipper.Id = [Order].ShipVia
WHERE
    [Order].OrderDate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT
    [OrderDetail].OrderId,
    [OrderDetail].Quantity,
    [Product].ProductName
FROM
    [OrderDetail]
JOIN
    [Product] ON [Product].Id = [OrderDetail].ProductId
WHERE
    [OrderDetail].OrderId = 10251
ORDER BY
    [Product].ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT
    [Order].CustomerId,
    [Customer].CompanyName,
    [Order].EmployeeId,
    [Employee].LastName
FROM
    [Order]
JOIN
    [Employee] ON [Employee].Id = [Order].EmployeeId
JOIN
    [Customer] ON [Customer].Id = [Order].CustomerId