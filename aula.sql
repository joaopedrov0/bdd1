CREATE DATABASE IF NOT EXISTS mercadinho;

USE mercadinho;

CREATE TABLE IF NOT EXISTS Venda(
	idVenda INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	valorTotal REAL NOT NULL,
	dataHora DATETIME NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS Produto(
	idProduto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome TEXT NOT NULL,
	valor REAL NOT NULL
);

CREATE TABLE IF NOT EXISTS ItemVenda(
	idItemVenda INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	idVenda INT NOT NULL,
	idProduto INT NOT NULL,
	valorUnitario REAL NOT NULL,
	quantidade INT NOT NULL,
	FOREIGN KEY (idVenda) REFERENCES Venda(idVenda),
	FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

INSERT INTO Produto VALUES (NULL, 3.59,'Macarrão');

INSERT INTO Produto VALUES (NULL, 7.34, 'Suco de laranja');

INSERT INTO Produto VALUES (NULL, 8.67, 'Energy Drink');

INSERT INTO Produto VALUES (NULL, 4.56, 'Margarina');

INSERT INTO Produto VALUES (NULL, 8.79, 'Amendoim');


INSERT INTO Venda VALUES (NULL, 10, NULL);

INSERT INTO ItemVenda VALUES (NULL, 1, 1, 3.59, 1);

INSERT INTO ItemVenda VALUES (NULL, 1, 2, 7.34, 1);


INSERT INTO Venda VALUES (NULL, 13, NULL);

INSERT INTO ItemVenda VALUES (NULL, 2, 4, 4.50, 1);

INSERT INTO ItemVenda VALUES (NULL, 2, 5, 8.79, 1);



SELECT 
Venda.idVenda AS 'Venda', 
Produto.nome AS 'Nome', 
Produto.valor AS 'Valor Unitário' 
FROM Venda 
INNER JOIN ItemVenda ON (Venda.idVenda = ItemVenda.idVenda) 
INNER JOIN Produto ON (Produto.idProduto = ItemVenda.idProduto);