/*
1) Queremos ter uma lista de todas as categorias.
*/
SELECT * 
FROM categorias;
/*
2) Como as categorias não possuem imagens, você está interessado em obter apenas um Nome e descrição da lista de categorias.
*/
SELECT CategoriaNome AS Nome, Descricao
FROM categorias;

/*
3) Obtenha uma lista dos produtos.
*/

SELECT * 
FROM produtos;

/*
4) Existem produtos descontinuados? (Descontinuado = 1). Não
*/

SELECT *
FROM produtos
WHERE Descontinuado =1;

/*
5) Na sexta-feira, você deve se reunir com o fornecedor nr. 8. Quais são os
produtos que eles fornecem? 4 produtos, chocolate e biscoitos.
*/

SELECT *
FROM produtos
WHERE CategoriaID=8;

/*
6) Queremos saber todos os produtos cujo preço unitário se encontra
entre 10 e 22.
*/

SELECT *
FROM produtos
WHERE PrecoUnitario BETWEEN 10 AND 22;

/*
7) Fica definido que um produto deve ser solicitado ao fornecedor se suas unidades em estoque forem inferiores ao nível de reabastecimento. Existem produtos a solicitar? Sim.
*/

SELECT *
FROM produtos
WHERE UnidadesEstoque < NivelReabastecimento;

/*
8) Você quer saber todos os produtos da lista anterior, mas que as unidades pedidas sejam iguais a zero.
*/
SELECT *
FROM produtos
WHERE UnidadesEstoque < NivelReabastecimento AND UnidadesPedidas=0;

/*
CLIENTES
*/

/*
1) Obtenha uma lista de todos os clientes com contato, empresa, cargo, País. Classifique a lista por país.
*/

SELECT Contato, empresa AS Empresa, Titulo, Pais
FROM clientes
ORDER BY Pais;

/*
2) Queremos atender todos os clientes que possuem o título de “Proprietário".
Esse título estará em inglês (Owner).
*/
SELECT *
FROM clientes
WHERE Titulo='Owner';

/*
3) A operadora de telefonia atendeu um cliente e não lembra o nome dele. Sabe
apenas que começa com "C". Podemos ajudá-lo a obter uma lista com
todos os contatos que começam com a letra C?
*/
SELECT *
FROM clientes
WHERE Contato LIKE 'C%';

/*
Faturas

1. Obtenha uma lista de todas as faturas, ordenadas por data da fatura em ordem ascendente.
2. Agora é necessário uma lista de faturas com o país de envio "EUA" e que a FormaeEnvio seja diferente de 3.
3. O cliente 'GOURL' fez um pedido? Sim.
4. Você deseja visualizar todas as faturas dos funcionários 2, 3, 5, 8 e 9.
*/

#1
SELECT * 
FROM faturas
ORDER BY datafatura;

#2
SELECT * FROM faturas WHERE paisEnvio = 'USA' AND formaEnvio != 3;

#3
SELECT * FROM faturas WHERE ClienteID = 'GOURL';

#4
SELECT * FROM FATURAS WHERE EmpregadoID IN(2, 3, 5, 8, 9);
/*
Queries I - Parte II

Nesta segunda parte, vamos intensificar a prática de consultas SELECT, adicionando ALIAS, LIMIT e OFFSET.*/

/*Produtos

1. Obtenha a lista de todos os produtos em ordem decrescente por preço unitário.
2. Obtenha a lista dos 5 melhores produtos cujo preço unitário é o mais "Caro".
3. Obtenha um top 10 dos produtos com mais unidades em estoque.*/

#1 
SELECT * FROM produtos
ORDER BY precoUnitario;

#2
SELECT * FROM produtos
ORDER BY precoUnitario DESC
LIMIT 5;

#3
SELECT * FROM produtos
ORDER BY UnidadesEstoque desc
LIMIT 10;

/*DetalheFatura

1. Obtenha uma lista de FaturaId, Produto, Quantidade.
2. Classifique a lista acima por Quantidade decrescente.
3. Filtre a mesma lista apenas para os produtos cuja quantidade esteja entre 50 e 100.
4. Em outra nova consulta, obtenha uma lista com os seguintes nomes de coluna: Número da fatura (FaturaId), Produto (ProdutoId), Total (Preço Unitário * Quantidade) */ 

#1
SELECT faturaID, ProdutoId, Quantidade
FROM detalheFatura;

#2
SELECT faturaID, ProdutoId, Quantidade
FROM detalheFatura
ORDER BY Quantidade DESC;

#3
SELECT faturaID, ProdutoId, Quantidade
FROM detalheFatura
WHERE Quantidade BETWEEN 50 AND 100
ORDER BY Quantidade DESC;

#4
SELECT faturaID AS 'Numero da Fatura', ProdutoID AS Produto, (PrecoUnitario*Quantidade) AS Total
FROM detalhefatura;


/*EXTRAS: Sobrou tempo? Você quer continuar praticando? Deixamos alguns exercícios extras da mesma base:

1. Obtenha uma lista de todos os clientes que moram no “Brasil” ou “México” ou que tenham um título que começa com "Vendas" (o termo estará em inglês: ‘Sales’);
2. Obtenha uma lista de todos os clientes que pertencem a uma empresa que comece com a letra “A”.
3. Obtenha uma lista com os seguinte dados: Cidade, Contato( renomeie para Nome e Sobrenome), Título (renomeie para Cargo), de todos os clientes que são da cidade "Madrid".
4. Obtenha uma lista de todas as faturas com ID entre 10.000 e 10.500
5. Obtenha uma lista de todas as faturas com ID entre 10.000 e 10.500 ou de clientes com IDs começando com "B".
6. Existem notas fiscais que informam a cidade expedidora “Vancouver” ou que utilizam FormaEnvio = 3?
7. Qual é a identificação do funcionário de “Buchanan”? 5.
8. Existem Notas Fiscais com o EmpregadoId do funcionário acima? SIm muitas.
*/
#1
SELECT * FROM clientes WHERE Pais IN('Brazil', 'Mexico');

/*ou*/

SELECT * FROM clientes WHERE Pais='Brazil' OR Pais='Mexico';

#2
SELECT * FROM clientes WHERE Empresa LIKE 'a%';

#3
SELECT Cidade, Contato AS 'Nome e Sobrenome', Titulo AS Cargo
FROM clientes
WHERE Cidade IN('Madrid');

#4
SELECT * FROM faturas
WHERE FATURAID BETWEEN 10000 AND 10500;

#5
SELECT * FROM faturas
WHERE (FATURAID BETWEEN 10000 AND 10500) OR (ClienteID LIKE 'B%');

#6
SELECT * FROM faturas
WHERE (cidadeEnvio ='Vancouver') OR (FormaEnvio = 3);

#7
SELECT * FROM empregados WHERE sobrenome IN('Buchanan');

#8
SELECT * FROM faturas WHERE EmpregadoID=5;
