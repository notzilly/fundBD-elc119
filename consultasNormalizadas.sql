-- Consulta com Agregação (Min, Max, Count, Avg)
-- Consulta com Operador de Conjunto (Union, Except, Intersect)
-- Junção Externa (LEFT OUTER JOIN  |  RIGHT OUTER JOIN)
-- Junções com 3 ou mais tabelas
-- SubConsulta


--Quantidade de domínios que cada instituicao possui.
SELECT COUNT(*), instituicao.nome
FROM dominio
NATURAL JOIN instituicao
GROUP BY instituicao.nome
ORDER BY instituicao.nome

--Todos os dominios registrados da capital de MG
SELECT dominio AS 'Domínios da capital de MG', instituicao.nome AS 'Instituição'
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
) AS estado

--Mostrar as empresas que cadastraram dominios com mais de um numero de documento
SELECT nome, count(nome)
FROM instituicao
GROUP BY nome
HAVING count(nome) > 1