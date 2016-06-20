INSERT INTO localidade (uf, cidade, cep)
SELECT DISTINCT uf, cidade, cep
FROM tabelao;

INSERT INTO instituicao (documento, nome, id_localidade)
SELECT DISTINCT tabelao.documento, tabelao.nome, localidade.id_localidade
FROM tabelao, localidade
WHERE tabelao.uf=localidade.uf AND tabelao.cidade=localidade.cidade AND tabelao.cep=localidade.cep;

INSERT INTO dominio (dominio, data_cadastro, ultima_atualizacao, ticket, id_instituicao)
SELECT tabelao.dominio, tabelao.data_cadastro, tabelao.ultima_atualizacao, tabelao.ticket, instituicao.id_instituicao
FROM tabelao, instituicao
WHERE tabelao.documento=instituicao.documento AND tabelao.nome=instituicao.nome


-- QUery para poder testar o Outer join
INSERT INTO instituicao (documento, nome, id_localidade)
VALUES ('000.001.180/0002-05', 'Instituição Fantasma', 11)