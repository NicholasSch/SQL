SET SQL_SAFE_UPDATES = 0;


create database controle_financeiro;
use controle_financeiro;
CREATE TABLE usuario (
codigo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 nome varchar(45) NOT NULL,
rua varchar(45) NOT NULL,
 numero varchar(45) NOT NULL,
 bairro varchar(45) NOT NULL,
 cep varchar(8) NOT NULL,
 cidade varchar(45) NOT NULL,
 UF varchar(2) NOT NULL,
 data_de_nascimento DATETIME NOT NULL
);
#Conta pode ser poupança ou corrente
CREATE TABLE tipo_conta (
codigo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 descricao varchar(255) NOT NULL
);
CREATE TABLE conta (
codigo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 descricao varchar(255) NOT NULL,
 codigo_tipo_conta int NOT NULL,
 codigo_usuario int NOT NULL,
 saldo DECIMAL(10,2) NOT NULL,
 CONSTRAINT fk_tipo_conta_conta FOREIGN KEY (codigo_tipo_conta) REFERENCES
tipo_conta (codigo),
 CONSTRAINT fk_usuario_conta FOREIGN KEY (codigo_usuario) REFERENCES usuario
(codigo)
);
CREATE TABLE movimentacao (
codigo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 descricao varchar(255) NOT NULL,
 tipo_movimentacao ENUM('DEBITO', 'CREDITO') NOT NULL,
 valor DECIMAL(10,2) NOT NULL,
 codigo_conta int NOT NULL,
 data_movimentacao DATETIME NOT NULL,
 CONSTRAINT fk_movimentacao_conta FOREIGN KEY (codigo_conta) REFERENCES conta
(codigo)
);
INSERT INTO tipo_conta (descricao) VALUES
('Conta Poupança'),
('Conta Corrente');


INSERT INTO usuario (nome, rua, numero, bairro, cep, cidade, UF, data_de_nascimento) VALUES
('João Pedro', 'Carlos Vasconcelos', '050', 'Meireles', '60115170', 'Fortaleza', 'CE', '2000-01-01 00:00:00'),
('Maria Saraiva', 'Ana Bilhar', '1055', 'Aldeota', '60200110', 'Fortaleza', 'CE', '1995-06-12 15:30:00'),
('Ana Maria Braga', 'Washignton Soares', '2451', 'Edson Queiroz', '64201800', 'Fortaleza', 'CE',
'1985-11-20 00:00:00');


INSERT INTO conta (descricao, codigo_tipo_conta, codigo_usuario, saldo) VALUES
('Conta corrente', 1, 1, 0),
('Conta poupança', 2, 1, 10000),
('Conta corrente', 1, 2, 5000),
('Conta poupança', 2, 2, 2500),
('Conta corrente', 1, 3, 25000),
('Conta poupança', 2, 3, 500000);

INSERT INTO movimentacao (descricao, tipo_movimentacao, valor, codigo_conta,
data_movimentacao) VALUES
('Salário', 'CREDITO', 15000, 1, '2022-11-15 00:00:00'),
('Supermercado', 'DEBITO', 50, 1, '2022-11-25 15:00:00'),
('Supermercado', 'DEBITO', 50, 1, '2022-11-10 15:00:00'),
('Supermercado', 'DEBITO', 550.45, 1, '2023-03-18 12:35:00'),
('Supermercado', 'DEBITO', 243.25, 1, '2022-06-22 09:00:00'),
('Supermercado', 'CREDITO', 543.25, 1, '2022-03-22 09:00:00'),
('Compra de roupas no shopping', 'DEBITO', 753.25, 1, '2021-11-15 00:00:00'),
('Alimentação fim de semana', 'DEBITO', 243.20, 1, '2020-11-15 00:00:00'),
('Alimentação fim de semana', 'DEBITO', 33.25, 1, '2023-02-04 00:00:00'),
('Salário', 'CREDITO', 5000, 3, '2023-01-28 08:00:00'),
('Supermercado', 'DEBITO', 50, 3, '2023-01-04 00:00:00'),
('Supermercado', 'DEBITO', 50, 3, '2023-02-10 00:00:00'),
('Supermercado', 'DEBITO', 25.5, 3, '2023-02-07 00:00:00'),
('Supermercado', 'DEBITO', 550.45, 3, '2022-12-15 23:00:00'),
('Compra de roupas no shopping', 'DEBITO', 753.25, 3, '2022-09-15 01:00:00'),
('Alimentação fim de semana', 'DEBITO', 243.20, 3, '2022-12-01 22:00:00'),
('Alimentação fim de semana', 'DEBITO', 33.25, 3, '2023-03-30 20:00:00'),
('Alimentação fim de semana', 'CREDITO', 11.25, 3, '2023-03-10 20:00:00'),
('Alimentação fim de semana', 'DEBITO', 15.25, 3, '2023-03-15 20:00:00'),
('Salário', 'CREDITO', 25000, 5, '2023-01-05 15:00:00'),
('Supermercado', 'DEBITO', 150, 5, '2023-01-01 16:00:00'),
('Supermercado', 'DEBITO', 350.45, 5, '2023-02-15 13:00:00'),
('Supermercado', 'CREDITO', 150.45, 5, '2023-02-15 13:00:00'),
('Compra de roupas no shopping', 'DEBITO', 453.25, 5, '2023-03-02 20:00:00'),
('Alimentação fim de semana', 'DEBITO', 343.20, 5, '2023-01-30 20:00:00'),
('Alimentação fim de semana', 'DEBITO', 343.20, 5, '2023-01-15 20:00:00'),
('Alimentação fim de semana', 'DEBITO', 343.20, 5, '2023-01-07 20:00:00'),
('Alimentação fim de semana', 'DEBITO', 33.25, 5, '2023-03-17 20:00:00'),
('Pagamento de conta de telefone', 'DEBITO', 65.00, 2, '2023-03-07 09:30:00'),
('Compras no supermercado', 'DEBITO', 92.50, 3, '2023-03-06 12:00:00'),
('Recebimento de salário', 'CREDITO', 4000.00, 4, '2023-03-05 08:00:00'),
('Compras na loja de departamento', 'DEBITO', 150.00, 5, '2023-03-04 17:30:00'),
('Transferência para irmão', 'DEBITO', 80.00, 1, '2023-03-03 19:00:00'),
('Pagamento de conta de água', 'DEBITO', 80.00, 2, '2023-03-02 10:30:00'),
('Recebimento de pagamento', 'CREDITO', 700.00, 6, '2023-03-01 08:00:00'),
('Compras no shopping', 'DEBITO', 210.00, 3, '2023-02-28 14:30:00'),
('Pagamento de aluguel', 'DEBITO', 2500.00, 4, '2023-02-27 15:30:00'),
('Compras no mercado', 'DEBITO', 58.90, 1, '2023-02-26 12:00:00'),
('Transferência para pai', 'DEBITO', 200.00, 5, '2023-02-25 08:30:00'),
('Recebimento de pagamento', 'CREDITO', 1000.00, 6, '2023-02-24 16:00:00'),
('Compras na farmácia', 'DEBITO', 45.80, 2, '2023-02-23 11:00:00'),
('Pagamento de conta de luz', 'DEBITO', 110.00, 3, '2023-02-22 18:00:00'),
('Recebimento de salário', 'CREDITO', 3500.00, 4, '2023-02-21 09:00:00'),
('Compras na loja de conveniência', 'DEBITO', 20.00, 5, '2023-02-20 13:30:00'),
('Transferência para amigo', 'DEBITO', 75.00, 1, '2023-02-19 10:00:00'),
('Pagamento de conta de internet', 'DEBITO', 150.00, 2, '2023-02-18 14:00:00'),
('Recebimento de pagamento', 'CREDITO', 800.00, 6, '2023-02-17 08:00:00'),
('Compras no shopping', 'DEBITO', 350.00, 3, '2023-02-16 11:30:00'),
('Compra de roupas', 'DEBITO', 80.00, 1, '2023-04-23 15:30:00'),
('Transferência para amigo', 'DEBITO', 100.00, 2, '2023-04-22 18:00:00'),
('Recebimento de pagamento', 'CREDITO', 3000.00, 3, '2023-04-21 08:00:00'),
('Pagamento de conta de água', 'DEBITO', 50.00, 4, '2023-04-20 12:30:00'),
('Compras no supermercado', 'DEBITO', 120.50, 5, '2023-04-19 10:00:00'),
('Transferência para mãe', 'DEBITO', 150.00, 6, '2023-04-18 16:00:00'),
('Pagamento de conta de telefone', 'DEBITO', 100.00, 1, '2023-04-17 09:00:00'),
('Recebimento de salário', 'CREDITO', 5000.00, 2, '2023-04-16 08:00:00'),
('Compras na farmácia', 'DEBITO', 25.90, 3, '2023-04-15 14:30:00'),
('Compras na loja de conveniência', 'DEBITO', 12.00, 4, '2023-04-14 11:00:00'),
('Pagamento de conta de luz', 'DEBITO', 150.00, 5, '2023-04-13 18:00:00'),
('Recebimento de pagamento', 'CREDITO', 700.00, 6, '2023-04-12 08:00:00'),
('Transferência para irmã', 'DEBITO', 50.00, 1, '2023-04-11 17:00:00'),
('Compras na padaria', 'DEBITO', 30.00, 2, '2023-04-10 10:30:00'),
('Pagamento de conta de internet', 'DEBITO', 200.00, 3, '2023-04-09 14:00:00'),
('Recebimento de pagamento', 'CREDITO', 1200.00, 4, '2023-04-08 08:00:00'),
('Compras no shopping', 'DEBITO', 400.00, 5, '2023-04-07 12:00:00'),
('Pagamento de aluguel', 'DEBITO', 3000.00, 6, '2023-04-06 15:30:00'),
('Transferência para amigo', 'DEBITO', 50.00, 1, '2023-04-05 16:00:00'),
('Pagamento de conta de telefone', 'DEBITO', 75.00, 2, '2023-04-04 09:00:00'),
('Compras no supermercado', 'DEBITO', 120.50, 3, '2023-04-03 10:00:00'),
('Transferência para mãe', 'DEBITO', 150.00, 4, '2023-04-02 16:00:00'),
('Pagamento de conta de telefone', 'DEBITO', 100.00, 5, '2023-04-01 09:00:00'),
('Recebimento de salário', 'CREDITO', 5000.00, 6, '2023-03-31 08:00:00'),
('Compras na farmácia', 'DEBITO', 25.90, 1, '2023-03-30 14:30:00'),
('Compras na loja de conveniência', 'DEBITO', 12.00, 2, '2023-03-29 11:00:00'),
('Pagamento de conta de luz', 'DEBITO', 150.00, 3, '2023-03-28 18:00:00'),
('Recebimento de pagamento', 'CREDITO', 700.00, 4, '2023-03-27 08:00:00'),
('Transferência para irmã', 'DEBITO', 50.00, 5, '2023-03-26 17:00:00'),
('Compras na padaria', 'DEBITO', 30.00, 6, '2023-03-25 10:30:00'),
('Pagamento de conta de internet', 'DEBITO', 200.00, 1, '2023-03-24 14:00:00'),
('Recebimento de pagamento', 'CREDITO', 1200.00, 2, '2023-03-23 08:00:00'),
('Compras no shopping', 'DEBITO', 400.00, 3, '2023-03-22 12:00:00'),
('Pagamento de aluguel', 'DEBITO', 3000.00, 4, '2023-03-21 15:30:00'),
('Transferência para amigo', 'DEBITO', 50.00, 5, '2023-03-20 16:00:00'),
('Pagamento de conta de telefone', 'DEBITO', 75.00, 6, '2023-03-19 09:00:00'),
('Recebimento de salário', 'CREDITO', 5000.00, 1, '2023-03-18 08:00:00'),
('Compras na farmácia', 'DEBITO', 25.90, 2, '2023-03-17 14:30:00'),
('Compras na loja de conveniência', 'DEBITO', 12.00, 3, '2023-03-16 11:00:00'),
('Pagamento de conta de luz', 'DEBITO', 150.00, 4, '2023-03-15 18:00:00'),
('Compra de alimentos', 'DEBITO', 20.90, 2, '2023-03-12 14:20:00'),
('Pagamento de contas', 'DEBITO', 100.50, 4, '2023-04-07 10:15:00'),
('Recebimento de salário', 'CREDITO', 2500.00, 1, '2023-04-18 08:30:00'),
('Compra de medicamentos', 'DEBITO', 15.70, 3, '2023-04-22 16:45:00'),
('Transferência recebida', 'CREDITO', 1500.00, 2, '2023-04-11 12:00:00'),
('Pagamento de aluguel', 'DEBITO', 800.00, 5, '2023-03-29 09:00:00'),
('Compra de roupas', 'DEBITO', 120.80, 1, '2023-04-16 15:20:00'),
('Recebimento de reembolso', 'CREDITO', 500.00, 4, '2023-04-02 14:30:00'),
('Compra de eletrônicos', 'DEBITO', 499.99, 2, '2023-04-09 17:30:00'),
('Pagamento de seguro', 'DEBITO', 150.00, 6, '2023-03-28 11:45:00'),
('Compra de livros', 'DEBITO', 60.50, 3, '2023-04-12 09:00:00'),
('Recebimento de depósito', 'CREDITO', 1000.00, 5, '2023-04-07 15:30:00'),
('Pagamento de impostos', 'DEBITO', 320.00, 1, '2023-03-30 13:45:00'),
('Recebimento de venda', 'CREDITO', 900.00, 3, '2023-04-21 11:00:00'),
('Compra de material escolar', 'DEBITO', 85.00, 6, '2023-04-19 08:00:00'),
('Recebimento de pensão', 'CREDITO', 1500.00, 4, '2023-04-05 14:00:00'),
('Compra de eletrodomésticos', 'DEBITO', 700.00, 2, '2023-03-31 16:00:00'),
('Recebimento de empréstimo', 'CREDITO', 5000.00, 1, '2023-04-10 10:30:00'),
('Pagamento de plano de saúde', 'DEBITO', 180.00, 5, '2023-04-23 09:15:00'),
('Compra de material de construção', 'DEBITO', 200.00, 3, '2023-04-08 14:00:00'),
('Compra de produtos de limpeza', 'DEBITO', 25.40, 1, '2022-09-10 15:30:00'),
('Pagamento de conta de luz', 'DEBITO', 84.20, 2, '2022-11-15 10:45:00'),
('Transferência bancária', 'DEBITO', 1000.00, 3, '2022-12-30 08:20:00'),
('Compra de mantimentos', 'DEBITO', 150.75, 4, '2023-01-05 14:10:00'),
('Depósito em dinheiro', 'CREDITO', 500.00, 5, '2023-01-07 18:30:00'),
('Pagamento de conta de água', 'DEBITO', 72.35, 6, '2023-02-01 11:20:00'),
('Compra de medicamentos', 'DEBITO', 47.90, 1, '2023-02-05 09:50:00'),
('Transferência bancária', 'DEBITO', 250.00, 2, '2023-02-10 14:15:00'),
('Pagamento de conta de telefone', 'DEBITO', 120.30, 3, '2023-02-15 16:40:00'),
('Compra de roupas', 'DEBITO', 189.99, 4, '2023-03-02 13:25:00'),
('Depósito em dinheiro', 'CREDITO', 800.00, 5, '2023-03-05 20:15:00'),
('Pagamento de conta de internet', 'DEBITO', 55.60, 6, '2023-03-20 09:10:00'),
('Compra de calçados', 'DEBITO', 98.75, 1, '2023-03-25 15:30:00'),
('Transferência bancária', 'DEBITO', 300.00, 2, '2023-04-01 10:30:00'),
('Pagamento de conta de luz', 'DEBITO', 89.90, 3, '2023-04-05 13:50:00'),
('Compra de livros', 'DEBITO', 65.20, 4, '2023-04-08 16:10:00'),
('Depósito em dinheiro', 'CREDITO', 1000.00, 5, '2023-04-10 19:20:00'),
('Pagamento de conta de água', 'DEBITO', 68.50, 6, '2023-04-15 12:40:00'),
('Compra de eletrônicos', 'DEBITO', 1200.00, 1, '2023-04-18 14:30:00'),
('Transferência bancária', 'DEBITO', 500.00, 2, '2023-04-20 11:20:00'),
('Pagamento de conta de telefone', 'DEBITO', 85.40, 3, '2023-04-23 09:10:00'),
('Compra de comida', 'DEBITO', 65.23, 4, '2022-10-05 15:34:21'),
('Pagamento de conta de luz', 'DEBITO', 87.99, 3, '2023-02-12 10:23:15'),
('Depósito de salário', 'CREDITO', 3214.50, 1, '2023-04-16 08:42:19'),
('Compra de gasolina', 'DEBITO', 45.80, 2, '2022-11-30 14:12:10'),
('Pagamento de aluguel', 'DEBITO', 1500.00, 6, '2022-09-15 18:27:03'),
('Venda de produto', 'CREDITO', 750.75, 5, '2023-03-28 13:01:47'),
('Compra de roupas', 'DEBITO', 230.50, 2, '2023-01-09 11:20:32'),
('Pagamento de seguro', 'DEBITO', 349.90, 1, '2022-12-19 09:15:56'),
('Depósito em conta poupança', 'CREDITO', 300.00, 4, '2022-10-23 17:48:02'),
('Compra de material de escritório', 'DEBITO', 72.10, 6, '2023-02-26 14:36:48'),
('Pagamento de conta de água', 'DEBITO', 120.50, 3, '2022-12-03 09:57:13'),
('Venda de serviços', 'CREDITO', 1200.00, 1, '2023-04-10 11:11:22'),
('Compra de eletrônicos', 'DEBITO', 750.99, 5, '2022-11-20 16:19:38'),
('Pagamento de mensalidade de academia', 'DEBITO', 80.00, 2, '2022-10-07 20:14:45'),
('Depósito em conta corrente', 'CREDITO', 200.00, 4, '2023-02-01 14:55:01'),
('Compra de livros', 'DEBITO', 56.70, 1, '2022-12-30 11:07:17'),
('Pagamento de fatura de cartão de crédito', 'DEBITO', 342.90, 6, '2023-03-05 09:08:29'),
('Venda de produto', 'CREDITO', 489.50, 3, '2022-11-14 12:45:18'),
('Compra de brinquedos', 'DEBITO', 129.99, 5, '2023-01-20 15:28:52'),
('Pagamento de seguro de carro', 'DEBITO', 198.00, 1, '2022-09-28 08:36:57'),
('Compra de roupas', 'DEBITO', 546.23, 2, '2022-07-10 14:21:35'),
('Pagamento de aluguel', 'DEBITO', 1200.00, 3, '2022-08-08 10:15:42'),
('Transferência para conta poupança', 'DEBITO', 350.00, 1, '2022-09-05 09:00:00'),
('Depósito salário', 'CREDITO', 2100.50, 4, '2022-10-01 15:37:21'),
('Compra de alimentos', 'DEBITO', 98.99, 5, '2022-11-12 11:45:56'),
('Recebimento de pagamento de cliente', 'CREDITO', 650.00, 6, '2022-12-07 13:20:18'),
('Pagamento de conta de água', 'DEBITO', 87.20, 3, '2023-01-03 17:30:00'),
('Depósito em conta corrente', 'CREDITO', 500.00, 2, '2023-02-20 08:45:02'),
('Compra de eletrônicos', 'DEBITO', 1299.99, 1, '2023-03-14 20:12:47'),
('Pagamento de fatura de cartão de crédito', 'DEBITO', 764.30, 6, '2023-04-20 14:03:52'),
('Compra de materiais de construção', 'DEBITO', 225.70, 4, '2023-04-22 11:11:11'),
('Transferência para conta corrente', 'DEBITO', 200.00, 2, '2023-04-24 14:16:55'),
('Recebimento de pagamento de cliente', 'CREDITO', 900.00, 1, '2023-04-24 18:59:01'),
('Compra de alimentos', 'DEBITO', 45.60, 6, '2023-04-24 21:45:23'),
('Pagamento de conta de luz', 'DEBITO', 65.90, 4, '2023-04-25 08:30:00'),
('Depósito salário', 'CREDITO', 1900.00, 5, '2023-04-25 11:25:40'),
('Compra de roupas', 'DEBITO', 359.80, 1, '2023-04-25 16:48:12'),
('Transferência para conta poupança', 'DEBITO', 250.00, 3, '2023-04-25 20:15:01'),
('Pagamento de aluguel', 'DEBITO', 900.50, 3, '2023-04-23 15:30:00'),
('Compras no supermercado', 'DEBITO', 135.99, 5, '2023-04-23 18:45:00'),
('Transferência para conta poupança', 'DEBITO', 250.00, 2, '2023-04-22 09:15:00'),
('Salário', 'CREDITO', 5000.00, 1, '2023-04-22 12:00:00'),
('Pagamento de fatura do cartão', 'DEBITO', 800.00, 6, '2023-04-22 14:30:00'),
('Depósito em dinheiro', 'CREDITO', 2000.00, 4, '2023-04-21 10:00:00'),
('Pagamento de conta de luz', 'DEBITO', 150.00, 3, '2023-04-21 16:00:00'),
('Compras no shopping', 'DEBITO', 300.00, 2, '2023-04-20 14:00:00'),
('Transferência para outra conta', 'DEBITO', 500.00, 1, '2023-04-20 17:00:00'),
('Jantar em restaurante', 'DEBITO', 120.50, 5, '2023-04-19 20:30:00'),
('Salário', 'CREDITO', 5000.00, 6, '2023-04-19 09:00:00'),
('Pagamento de fatura do cartão', 'DEBITO', 800.00, 4, '2023-04-19 12:00:00'),
('Depósito em dinheiro', 'CREDITO', 1000.00, 3, '2023-04-18 10:00:00'),
('Pagamento de conta de telefone', 'DEBITO', 90.00, 2, '2023-04-18 15:00:00'),
('Compras no supermercado', 'DEBITO', 180.00, 1, '2023-04-17 19:00:00'),
('Transferência para conta poupança', 'DEBITO', 300.00, 5, '2023-04-17 22:00:00'),
('Salário', 'CREDITO', 5000.00, 4, '2023-04-16 12:00:00'),
('Pagamento de fatura do cartão', 'DEBITO', 800.00, 3, '2023-04-16 15:00:00'),
('Depósito em dinheiro', 'CREDITO', 1500.00, 2, '2023-04-15 10:00:00'),
('Pagamento de conta de água', 'DEBITO', 120.00, 1, '2023-04-15 16:00:00');


--@block 1.
SELECT nome, data_de_nascimento FROM usuario

--@block 2.
SELECT descricao,saldo FROM conta WHERE codigo = 1

--@block 3.
select * FROM movimentacao

--@block 4.
INSERT INTO usuario (nome, rua, numero, bairro, cep, cidade, UF, data_de_nascimento) VALUES
('Jorge', 'Mucuripe', '003', 'Cararu', '61774321', 'Fortaleza', 'CE', '2002-01-16 00:00:00');

INSERT INTO tipo_conta (descricao) VALUES
('Conta investimento');

INSERT INTO conta (descricao, codigo_tipo_conta, codigo_usuario, saldo) VALUES
('Conta investimento', 3, 4, 50000);

INSERT INTO movimentacao (descricao, tipo_movimentacao, valor, codigo_conta,
data_movimentacao) VALUES
('Salário', 'CREDITO', 10000.00, 7, '2023-07-27 00:00:00');

--@block 5.
UPDATE usuario
SET cep = 60115170
WHERE codigo = 2;

--@block 6.
DELETE FROM movimentacao WHERE codigo_conta = 3;

--@block 7.
SELECT SUM(saldo) FROM conta 

--@block 8.
select AVG(valor) FROM movimentacao

--@block 9.
select AVG(valor) FROM movimentacao GROUP BY codigo_conta;

--@block 10.
SELECT COUNT(*)FROM movimentacao GROUP BY codigo_conta;

--@block 11.
SELECT usuario.codigo,nome,saldo FROM usuario LEFT JOIN conta ON usuario.codigo = conta.codigo_usuario ORDER BY usuario.codigo;

--@block 12.
SELECT usuario.codigo,nome FROM usuario INNER JOIN conta ON usuario.codigo = conta.codigo_usuario ORDER BY usuario.codigo;

--@block 13. 
SELECT usuario.codigo,nome,saldo,valor FROM usuario INNER JOIN conta ON usuario.codigo = conta.codigo_usuario LEFT JOIN movimentacao on conta.codigo = movimentacao.codigo_conta ORDER BY usuario.codigo;

--@block 14.
SELECT usuario.codigo,nome,descricao FROM usuario INNER JOIN conta on usuario.codigo = conta.codigo_usuario ORDER BY usuario.codigo

--@block 15. 
SELECT usuario.codigo,nome,conta.descricao,saldo, COUNT(movimentacao.codigo) FROM usuario INNER JOIN conta on usuario.codigo = conta.codigo_usuario LEFT JOIN movimentacao on conta.codigo = movimentacao.codigo_conta GROUP BY conta.codigo

--@block 16.
SELECT usuario.codigo,nome,descricao,tipo_movimentacao, valor FROM usuario INNER JOIN movimentacao WHERE usuario.codigo =1;