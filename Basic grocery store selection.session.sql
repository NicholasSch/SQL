CREATE TABLE Produtos(
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    descrição VARCHAR(255),
    nivel1 VARCHAR(100),
    nivel2 VARCHAR(100),
    nivel3 VARCHAR(100),
    preço DECIMAL(10,2),
    data_criação DATETIME,
    nome_supermercado VARCHAR(100)
    );
 -- @BLOCK
    CREATE TABLE Historcio_preços(
    codigo INT AUTO_INCREMENT,
    codigo_produto INT NOT NULL,
    preço DECIMAL(10,2),
    data_ DATETIME,
    PRIMARY KEY (codigo),
    FOREIGN KEY (codigo_produto) REFERENCES Produtos(codigo)
    );
-- @BLOCK
    INSERT INTO Produtos(descrição,nivel1,nivel2,nivel3,preço,data_criação,nome_supermercado)
    Values(
    'desc3',
    'nvl13',
    'nvl23',
    'nvl33',
    5.4,
    (TIMESTAMP('2024-09-10 14:30:45')),
    'atac'
    )

-- @BLOCK -- QUESTAO 9
INSERT INTO Historcio_preços(codigo_produto,preço,data_)
Values      
(1,5.2,TIMESTAMP('2022-10-10 14:30:45')),
(1,5.3,TIMESTAMP('2022-11-10 14:30:45')),
(2,5.15,TIMESTAMP('2022-10-10 14:30:45')),
(2,5.17,TIMESTAMP('2022-11-10 14:30:45'));
(3,5.2,TIMESTAMP('2022-10-10 14:30:45')), 
(3,5.3,TIMESTAMP('2022-11-10 14:30:45')), 
(4,5.15,TIMESTAMP('2022-10-10 14:30:45')), 
(4,5.17,TIMESTAMP('2022-11-10 14:30:45')),
(5,5.15,TIMESTAMP('2022-10-10 14:30:45')), 
(5,5.17,TIMESTAMP('2022-11-10 14:30:45'));



-- @BLOCK -- QUESTAO 1
        SELECT * FROM Produtos;

-- @BLOCK -- QUESTAO 2
        SELECT descrição ,nome_supermercado,preço FROM Produtos;

--@BLOCK -- QUESTAO 3
SELECT * FROM produtos WHERE data_criação > STR_TO_DATE('2023-08-01 15:00:00', '%Y-%m-%d %H:%i:%s');

--@BLOCK -- QUESTAO 4
SELECT *FROM produtos WHERE nivel1 = 'CAFÉ ALMOFADA';

--@BLOCK -- QUESTAO 5
SELECT *FROM produtos WHERE nivel1 = 'CAFÉ ALMOFADA' AND nivel1 = "MAÇÃ";

--@BLOCK -- QUESTAO 6
SELECT * FROM produtos WHERE descrição LIKE '%MAÇÃ%'

--@BLOCK -- QUESTAO 7
SELECT *FROM produtos WHERE preço>2.00;

--@BLOCK -- QUESTAO 8
SELECT *FROM produtos WHERE preço>2.00 AND preço<15.00;

--@Block -- QUESTAO 10
UPDATE produtos SET  nivel1 = "DETERGENTE LÍQUIDO" WHERE nivel1 = "DETERGENTE LÍQUIDO LOUÇAS";

-- @BLOCK -- QUESTAO 11
DELETE FROM produtos WHERE codigo = 1000;

-- @BLOCK -- QUESTAO 12
SELECT * FROM produtos 
INNER JOIN Historcio_preços
on Historcio_preços.codigo_produto = produtos.codigo
WHERE produtos.codigo = 50 and MONTH(produtos.data_criação)=08;

-- @BLOCK -- QUESTAO 13
SELECT COUNT(Historcio_preços.preço)
FROM produtos 
INNER JOIN Historcio_preços
on Historcio_preços.codigo_produto = produtos.codigo
WHERE produtos.codigo = 400;

-- @BLOCK -- QUESTAO 14
SELECT MAX(preço)
FROM produtos
WHERE nivel1='PÃO HAMB/LEITE/HOT DOG';

-- @BLOCK -- QUESTAO 15
SELECT MIN(preço)
FROM Historcio_preços;

-- @BLOCK -- QUESTAO 16
SELECT* FROM Produtos WHERE MONTH(data_criação) = 09;

-- @BLOCK -- QUESTAO 17
SELECT * FROM Produtos
ORDER BY preço ASC;

-- @BLOCK -- QUESTAO 18
SELECT * FROM(Historcio_preços)
INNER JOIN produtos
on Historcio_preços.codigo_produto = produtos.codigo
WHERE produtos.codigo = 500
ORDER BY Historcio_preços.preço DESC;

-- @BLOCK -- QUESTAO 19
SELECT MAX(preço)
FROM produtos;
-- @BLOCK -- QUESTAO 20
SELECT MIN(preço)
FROM produtos;






