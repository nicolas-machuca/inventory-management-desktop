--Tables (adjust names if needed)
CREATE TABLE IF NOT EXISTS Productos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    categoria TEXT,
    precio REAL NOT NULL,
    stock INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    telefono TEXT,
    email TEXT
);

CREATE TABLE IF NOT EXISTS Ventas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente_id INTEGER,
    fecha TEXT NOT NULL,
    total REAL NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);

CREATE TABLE IF NOT EXISTS DetalleVentas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    venta_id INTEGER,
    producto_id INTEGER,
    cantidad INTEGER NOT NULL,
    subtotal REAL NOT NULL,
    FOREIGN KEY (venta_id) REFERENCES Ventas(id),
    FOREIGN KEY (producto_id) REFERENCES Productos(id)
);

--Sample Products
INSERT INTO Productos (nombre, categoria, precio, stock) VALUES
('Posta Negra', 'Vacuno', 7990, 50),
('Pollo Entero', 'Aves', 2990, 80),
('Chorizo Artesanal', 'Embutidos', 4990, 30);

--Sample Clients
INSERT INTO Clientes (nombre, telefono, email) VALUES
('Juan Pérez', '+56911111111', 'juan@example.com'),
('María López', '+56922222222', 'maria@example.com');

--Sample Sale
INSERT INTO Ventas (cliente_id, fecha, total) VALUES
(1, date('now'), 15980);

INSERT INTO DetalleVentas (venta_id, producto_id, cantidad, subtotal) VALUES
(1, 1, 1, 7990),
(1, 3, 1, 7990);
