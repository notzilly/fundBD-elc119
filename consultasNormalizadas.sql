// Quantidade de domínios que cada instituicao possui.
SELECT COUNT(*), instituicao.nome
FROM dominio
NATURAL JOIN instituicao
GROUP BY instituicao.id_localidade, instituicao.nome
ORDER BY instituicao.nome

//