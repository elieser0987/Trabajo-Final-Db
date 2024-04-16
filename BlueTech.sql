create database BlueTechh;
use BlueTechh;

CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(50),
    Apellido NVARCHAR(50),
    Email NVARCHAR(100),
    Telefono NVARCHAR(20)
);


INSERT INTO Clientes (Nombre, Apellido, Email, Telefono)
VALUES
  ('Roberto', 'Flores', 'robertoflores@gmail.com', '809-333-4444'),
  ('Ana', 'García', 'anagarcia@gmail.com', '829-666-7777'),
  ('Pedro', 'López', 'pedrolopez@gmail.com', '849-999-0000'),
  ('María', 'Martínez', 'mariamartinez@gmail.com', '809-444-5555'),
  ('Carlos', 'Gómez', 'carlosgomez@gmail.com', '829-333-2222'),
  ('Sofia', 'Ruiz', 'sofiaruiz@gmail.com', '849-777-6666'),
  ('David', 'Sánchez', 'davidsanchez@gmail.com', '809-222-1111'),
  ('Laura', 'Flores', 'lauraflores@gmail.com', '829-555-4444'),
  ('Alejandro', 'Ramírez', 'alejandroramirez@gmail.com', '849-888-7777'),
  ('Patricia', 'Navarro', 'patricianavarro@gmail.com', '809-666-5555');




CREATE TABLE Proyectos (
    ProyectoID INT PRIMARY KEY IDENTITY,
    NombreProyecto NVARCHAR(100),
    Descripcion NVARCHAR(MAX),
    FechaInicio DATE,
    FechaFin DATE,
    ClienteID INT,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);


INSERT INTO Proyectos (NombreProyecto, Descripcion, FechaInicio, FechaFin, ClienteID)
VALUES
  ('Desarrollo de sitio web', 'Diseño y desarrollo de un sitio web corporativo para el cliente Juan Pérez.', '2024-03-01', '2024-05-31', 1),
  ('Aplicación móvil', 'Creación de una aplicación móvil para Android e iOS para el cliente María García.', '2024-04-15', '2024-07-15', 2),
  ('Integración de software', 'Integración del sistema CRM del cliente Pedro López con su plataforma de contabilidad.', '2024-02-01', '2024-04-30', 3),
  ('Mantenimiento de software', 'Realización de correcciones y mejoras en el software existente del cliente Ana Martínez.', '2024-05-01', '2024-08-31', 4),
  ('Consultoría de TI', 'Asesoría en la implementación de una nueva infraestructura de red para el cliente Carlos Gómez.', '2024-01-01', '2024-03-31', 5),
  ('Desarrollo de aplicación web', 'Creación de una aplicación web para el cliente Sofía Ruiz.', '2024-06-15', '2024-09-15', 6),
  ('Optimización de bases de datos', 'Optimización y mejora del rendimiento de las bases de datos del cliente David Sánchez.', '2024-03-15', '2024-06-15', 7),
  ('Despliegue de sistema ERP', 'Implementación y despliegue de un sistema ERP para el cliente Laura Flores.', '2024-02-15', '2024-05-15', 8),
  ('Desarrollo de software a medida', 'Desarrollo de un software personalizado para el cliente Alejandro Ramírez.', '2024-04-01', '2024-07-01', 9),
  ('Actualización de sistema de seguridad', 'Actualización y mejora del sistema de seguridad para el cliente Patricia Navarro.', '2024-05-15', '2024-08-15',10)


CREATE TABLE Empleados (
    EmpleadoID INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(50),
    Apellido NVARCHAR(50),
    Cargo NVARCHAR(100),
    Salario DECIMAL(10, 2)
);


INSERT INTO Empleados (Nombre, Apellido, Cargo, Salario)
VALUES
  ('Luis', 'González', 'Desarrollador de software', 30000.00),
  ('Elena', 'Hernández', 'Diseñador UX/UI', 35000.00),
  ('Andrés', 'Martínez', 'Analista de sistemas', 40000.00),
  ('Sara', 'Rodríguez', 'Ingeniero de pruebas', 38000.00),
  ('Diego', 'López', 'Arquitecto de soluciones', 45000.00),
  ('Natalia', 'Vásquez', 'Especialista en redes', 42000.00),
  ('Carlos', 'Gómez', 'Administrador de bases de datos', 43000.00),
  ('Laura', 'Díaz', 'Gerente de proyecto', 50000.00),
  ('Javier', 'Ramírez', 'Consultor de TI', 48000.00),
  ('Ana', 'Fernández', 'Especialista en seguridad informática', 47000.00);






CREATE TABLE Tareas (
    TareaID INT PRIMARY KEY IDENTITY,
    Descripcion NVARCHAR(MAX),
    FechaAsignacion DATE,
    FechaVencimiento DATE,
    ProyectoID INT,
    EmpleadoID INT,
    FOREIGN KEY (ProyectoID) REFERENCES Proyectos(ProyectoID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
);


INSERT INTO Tareas (Descripcion, FechaAsignacion, FechaVencimiento, ProyectoID, EmpleadoID)
VALUES
  ('Diseñar interfaz de usuario para el sitio web', '2024-04-01', '2024-04-10', 1, 1),
  ('Desarrollar backend del sitio web', '2024-04-11', '2024-04-20', 1, 2),
  ('Implementar pruebas de unidad', '2024-04-21', '2024-04-25', 1, 2),
  ('Desplegar sitio web en producción', '2024-04-26', '2024-04-28', 1, 1),
  ('Crear prototipos de pantallas para la aplicación móvil', '2024-04-01', '2024-04-05', 2, 3),
  ('Desarrollar código para la aplicación móvil (Android)', '2024-04-06', '2024-04-15', 2, 4),
  ('Desarrollar código para la aplicación móvil (iOS)', '2024-04-16', '2024-04-25', 2, 5),
  ('Realizar pruebas de la aplicación móvil', '2024-04-26', '2024-05-05', 2, 4),
  ('Publicar la aplicación móvil en las tiendas de aplicaciones', '2024-05-06', '2024-05-10', 2, 5),
  ('Analizar requisitos del cliente para la integración de software', '2024-04-01', '2024-04-03', 3, 6);


CREATE TABLE Pagos (
    PagoID INT PRIMARY KEY IDENTITY,
    Monto DECIMAL(10, 2),
    FechaPago DATE,
    ProyectoID INT,
    ClienteID INT,
    FOREIGN KEY (ProyectoID) REFERENCES Proyectos(ProyectoID),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);




INSERT INTO Pagos (Monto, FechaPago, ProyectoID, ClienteID)
VALUES
  (15000.00, '2024-04-15', 1, 1),
  (18000.00, '2024-04-20', 2, 2),
  (12000.00, '2024-04-25', 3, 3),
  (20000.00, '2024-04-28', 4, 4),
  (25000.00, '2024-05-05', 5, 5),
  (30000.00, '2024-05-10', 6, 6),
  (22000.00, '2024-04-05', 7, 7),
  (27000.00, '2024-04-15', 8, 8),
  (19000.00, '2024-04-30', 9, 9),
  (23000.00, '2024-05-10', 10, 10);
