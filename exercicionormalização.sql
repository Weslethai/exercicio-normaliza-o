	use normalização;
    CREATE Table Clientes (
id INT AUTO_INCREMENT PRIMARY KEY,
CPF VARCHAR(14),
Nome VARCHAR(100),
Nascimento DATE
);

CREATE TABLE Veiculos (
id INT AUTO_INCREMENT PRIMARY KEY,
Placa VARCHAR(9),
Veiculo VARCHAR(20),
COR VARCHAR(30),
Diaria DECIMAL (5,2)
);

CREATE TABLE Locacoes (
Id   INT AUTO_INCREMENT PRIMARY KEY,
id_Veiculo INT,
id_Cliente INT,
Dias INT,
Total DECIMAL(5,2),
FOREIGN KEY (id_veiculo) REFERENCES Veiculos(id),
FOREIGN KEY (id_cliente) REFERENCES Clientes(id)
);


INSERT INTO Clientes (CPF, Nome, Nascimento) VALUES
('123.456.789-01', 'Ariano Suassuna', '1022-05-21'),
('543.765.987-23', 'Grace Hopper', '2002-04-29'),
('987.654.231-90', 'Richard Feynman', '2001-10-12'),
('432.765.678-67', 'Edgar Poe', '1998-12-14'),
('927.384.284-44', 'Gordon Freeman', '1984-11-26');


INSERT INTO Veiculos (Placa, Veiculo, Cor, Diaria) VALUES
('WER-3456', 'Fusca', 'Preto', 30.00),
('FDS-8384', 'Variante', 'Rosa', 60.00),
('CVB-9933', 'Comodoro', 'Preto', 20.00),
('FGH-2256', 'Deloriam', 'Azul', 80.00),
('DDI-3948', 'Brasília', 'Amarela', 45.00);


INSERT INTO Locacoes (id_veiculo, id_cliente , Dias, Total) VALUES
(1, 1, 3, 90.00),
(2, 2, 7, 420.00),
(3, 3, 1, 20.00),
(4, 4, 3, 240.00),
(5, 5, 7, 315.00);

CREATE VIEW Locacoes_Clientes_Veiculos AS
SELECT 
    L.id AS LocacaoID,
    V.Placa,
    V.Veiculo,
    V.Cor,
    V.Diaria,
    L.Dias,
    L.Total,
    C.Nome AS Cliente,
    C.CPF,
    C.Nascimento
FROM 
    Locacoes L
JOIN 
    Veiculos V ON L.id_Veiculo = V.id
JOIN 
    Clientes C ON L.id_Cliente = C.id;

Select *from Locacoes_Clientes_Veiculos;