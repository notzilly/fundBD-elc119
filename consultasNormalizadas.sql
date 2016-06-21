-- Consulta com Agregação (Min, Max, Count, Avg)
-- Consulta com Operador de Conjunto (Union, Except, Intersect)
-- Junção Externa (LEFT OUTER JOIN  |  RIGHT OUTER JOIN)
-- Junções com 3 ou mais tabelas
-- SubConsulta


-- Quantidade de domínios que cada instituicao possui.
SELECT nome, COUNT(*) AS QTD
FROM dominio
NATURAL JOIN instituicao
GROUP BY nome
ORDER BY QTD DESC;

-- Todos os dominios registrados da capital de MG
SELECT dominio AS 'Domínios da capital de MG', nome AS 'Instituição'
FROM dominio
NATURAL JOIN instituicao
NATURAL JOIN
(
	(
	SELECT *
	FROM localidade
	WHERE cidade = 'belo horizonte'
	)
UNION
	(
	SELECT *
	FROM localidade
	WHERE uf = 'MG'
	)
) AS estado;

-- Mostrar as empresas que cadastraram dominios com mais de um numero de documento
SELECT nome, count(nome) AS QTD
FROM instituicao
GROUP BY nome
HAVING QTD > 1
ORDER BY QTD DESC;


-- Mostrar nome e dominio da instituição que possui o nº do cep entre '68000-000' e '70500-000' e que o nome comece com 'i'
SELECT nome, dominio
FROM dominio
RIGHT JOIN instituicao USING (id_instituicao)
NATURAL JOIN localidade
WHERE cep BETWEEN '68000-000' AND '70500-000' AND nome LIKE 'i%';

-- Média total da quantidade de domínios
SELECT uf, AVG(domPorCidade) as 'Media de dominios por estado'
FROM
(SELECT uf, cidade, COUNT(cidade) AS domPorCidade
FROM dominio
NATURAL JOIN instituicao
NATURAL JOIN localidade 
GROUP BY cidade) AS cidade
GROUP BY uf;