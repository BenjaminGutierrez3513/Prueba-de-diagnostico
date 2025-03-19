CREATE DATABASE InventarioProductos; 

USE InventarioProductos;

CREATE TABLE Bodegas (
	 ID_Bodega INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL
);

CREATE TABLE Sucursales (
    ID_Sucursal INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    ID_Bodega INT NOT NULL,
    FOREIGN KEY (ID_Bodega) REFERENCES Bodegas(ID_Bodega)
);

CREATE TABLE Productos (
    ID_Producto INT PRIMARY KEY IDENTITY(1,1),
    Codigo NVARCHAR(15) UNIQUE NOT NULL,
    Nombre NVARCHAR(50) NOT NULL,
    ID_Bodega INT NOT NULL,
    ID_Sucursal INT NOT NULL,
    Moneda NVARCHAR(3) NOT NULL CHECK (Moneda IN ('USD', 'EUR', 'MXN')),
    Precio DECIMAL(10,2) NOT NULL CHECK (Precio >= 0),
    Descripcion NVARCHAR(1000) NOT NULL,
    FOREIGN KEY (ID_Bodega) REFERENCES Bodegas(ID_Bodega),
    FOREIGN KEY (ID_Sucursal) REFERENCES Sucursales(ID_Sucursal)
);

CREATE TABLE Materiales (
    ID_Material INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE ProductoMaterial (
    ID_Producto INT NOT NULL,
    ID_Material INT NOT NULL,
    PRIMARY KEY (ID_Producto, ID_Material),
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto),
    FOREIGN KEY (ID_Material) REFERENCES Materiales(ID_Material)
);

INSERT INTO Bodegas (Nombre) VALUES 
('Bodega 1'), 
('Bodega 2'), 
('Bodega 3');

INSERT INTO Sucursales (Nombre, ID_Bodega) VALUES 
('Sucursal 1', 1),
('Sucursal 2', 1),
('Sucursal 3', 2),
('Sucursal 4', 2),
('Sucursal 5', 3),
('Sucursal 6', 3);

INSERT INTO Materiales (Nombre) VALUES 
('Plástico'),
('Metal'),
('Madera'),
('Vidrio'),
('Textil');

INSERT INTO Productos (Codigo, Nombre, ID_Bodega, ID_Sucursal, Moneda, Precio, Descripcion) VALUES 
('PROD01K', 'Set Comedor', 1, 2, 'USD', 1500, 'Elegante set de comedor de madera natural, incluye mesa y sillas.'),
('PROD02M', 'Mesa de Vidrio', 2, 3, 'EUR', 1200, 'Mesa moderna con superficie de vidrio templado y base de acero.'),
('PROD03C', 'Silla de Plástico', 3, 5, 'MXN', 200, 'Silla ergonómica de plástico resistente, ideal para exteriores.');


INSERT INTO ProductoMaterial (ID_Producto, ID_Material) VALUES 
(1, 3), -- Set Comedor - Madera
(1, 4), -- Set Comedor - Vidrio
(2, 4), -- Mesa de Vidrio - Vidrio
(2, 2), -- Mesa de Vidrio - Metal
(3, 1); -- Silla de Plástico - Plástico


--consultas para verificar datos 
SELECT * FROM Bodegas;
SELECT * FROM Sucursales;
SELECT * FROM Materiales;
SELECT * FROM Productos;
SELECT * FROM ProductoMaterial;

