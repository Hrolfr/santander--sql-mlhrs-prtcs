CREATE ROLE professores NOCREATEDB NOCREATEROLE INHERIT NOLOGIN NOBYPASSRLS CONNECTION LIMIT 10;
ALTER ROLE professores PASSWORD '123';
--CREATE ROLE daniel LOGIN PASSWORD '123';
--DROP ROLE daniel
--CREATE ROLE daniel LOGIN PASSWORD '123' IN ROLE professores;

CREATE ROLE daniel LOGIN PASSWORD '123'  ROLE professores;
DROP ROLE daniel;

CREATE TABLE teste (nome varchar);
GRANT ALL ON TABLE teste TO professores;
CREATE ROLE daniel LOGIN PASSWORD '123';
CREATE ROLE daniel INHERIT LOGIN PASSWORD '123' IN ROLE professores;

REVOKE professores FROM daniel;

----------------------------------------------------------------------
(SCHEMA do financas)

CREATE TABLE IF NOT EXISTS banco (
	numero INTEGER NOT NULL,
	nome VARCHAR(50) NOT NULL,
	ativo BOOLEAN NOT NULL DEFAULT TRUE,
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (numero)
);

CREATE TABLE IF NOT EXISTS agencia (
	banco_numero INTEGER NOT NULL,
	numero INTEGER NOT NULL,
	nome VARCHAR(80) NOT NULL,
	ativo BOOLEAN NOT NULL DEFAULT TRUE,
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (banco_numero,numero),
	FOREIGN KEY (banco_numero) REFERENCES banco (numero)
);

CREATE TABLE IF NOT EXISTS cliente (
	numero BIGSERIAL PRIMARY KEY,
	nome VARCHAR(120) NOT NULL,
	email VARCHAR(250) NOT NULL,
	ativo BOOLEAN NOT NULL DEFAULT TRUE,
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS conta_corrente (
	banco_numero INTEGER NOT NULL,
	agencia_numero INTEGER NOT NULL,
	numero BIGINT NOT NULL,
	digito SMALLINT NOT NULL,
	cliente_numero BIGINT NOT NULL,
	ativo BOOLEAN NOT NULL DEFAULT TRUE,
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (banco_numero,agencia_numero,numero,digito,cliente_numero),
	FOREIGN KEY (banco_numero,agencia_numero) REFERENCES agencia (banco_numero,numero),
	FOREIGN KEY (cliente_numero) REFERENCES cliente (numero)
);

CREATE TABLE IF NOT EXISTS tipo_transacao (
	id SMALLSERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	ativo BOOLEAN NOT NULL DEFAULT TRUE,
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS cliente_transacoes (
	id BIGSERIAL PRIMARY KEY,
	banco_numero INTEGER NOT NULL,
	agencia_numero INTEGER NOT NULL,
	conta_corrente_numero BIGINT NOT NULL,
	conta_corrente_digito SMALLINT NOT NULL,
	cliente_numero BIGINT NOT NULL,
	tipo_transacao_id SMALLINT NOT NULL,
	valor NUMERIC(15,2) NOT NULL,
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero) REFERENCES conta_corrente(banco_numero,agencia_numero,numero,digito,cliente_numero)
);


SELECT numero,nome FROM banco; (me dá a listagem dos bancos)
SELECT numero,nome,ativo FROM banco;
SELECT banco_numero,numero,nome FROM agencia;
SELECT numero,nome,email FROM cliente;
SELECT id,nome FROM tipo_transacao;
SELECT banco_numero,agencia_numero,numero,cliente_numero FROM conta_corrente;
SELECT banco_numero,agencia_numero,cliente_numero FROM cliente_transacoes;

-----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS teste (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS teste;

CREATE TABLE IF NOT EXISTS teste (
  cpf VARCHAR(11) NOT NULL,
  nome VARCHAR(50) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(cpf)	
);

INSERT INTO teste (cpf,nome,created_at)
VALUES('55236745812','Selma Santos','2019-7-01 12:00:00');

INSERT INTO teste (cpf,nome,created_at)
VALUES('55236745812','Selma Santos','2019-7-01 12:00:00') ON CONFLICT (cpf) DO NOTHING;

UPDATE teste SET nome = 'Pedro Alvarenga' WHERE cpf = '55236745812';

SELECT * FROM teste;

---------------------------------------------------------------
Como fazer uma visualização das tabelas sem o SELECT * :

SELECT * FROM information_schema.columns WHERE table_name = 'banco';
SELECT column_name FROM information_schema.columns WHERE table_name = 'banco';
SELECT column_name,data_type FROM information_schema.columns WHERE table_name = 'banco';
----------------------------------------------------------------

--AVG
--COUNT (having)
--MAX
--MIN
--SUM

SELECT * FROM cliente_transacoes;
SELECT valor FROM cliente_transacoes;

SELECT AVG (valor) FROM cliente_transacoes;
--Me dá a média de valores que é: 142.2453468780971259

SELECT COUNT(numero)
FROM cliente;

SELECT COUNT(numero),email
FROM cliente
WHERE email ILIKE '%gmail.com'
-- gera: ERROR:  column "cliente.email" must appear in the GROUP BY clause or be used in an aggregate function
--LINE 1: SELECT COUNT(numero),email                           ^
--SQL state: 42803
--Character: 22 (eu preciso agrupar,então:)

SELECT COUNT(numero),email
FROM cliente
WHERE email ILIKE '%gmail.com'
GROUP BY email;

SELECT MAX(numero)
FROM cliente;

SELECT MIN(numero)
FROM cliente;

--Isso torna-se mais útil quando:
SELECT MAX(valor)
FROM cliente_transacoes;

SELECT MIN(valor)
FROM cliente_transacoes;

SELECT MAX(valor), tipo_transacao_id
FROM cliente_transacoes;
-- gera:
--ERROR:  column "cliente_transacoes.tipo_transacao_id" must appear in the GROUP BY clause or be used in an aggregate function
--LINE 1: SELECT MIN(valor), tipo_transacao_id
                          ^
--SQL state: 42803
--Character: 20

SELECT MAX(valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id;

SELECT MIN(valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id;
--Funciona

SELECT column_name,data_type FROM information_schema.columns WHERE table_name = 'cliente_transacoes';

SELECT COUNT(id),tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id
HAVING COUNT(id) > 150;
--útil para identificar duplicatas na tabela

SELECT SUM(valor)
FROM cliente_transacoes;

SELECT SUM(valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id
ORDER BY tipo_transacao_id ASC;
--ascendente

SELECT SUM(valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id
ORDER BY tipo_transacao_id DESC;
--descendente

-------------------------------------------------------------------

SELECT numero,nome FROM banco;
SELECT banco_numero,numero, nome FROM agencia;
SELECT numero,nome FROM cliente;
SELECT banco_numero,agencia_numero,numero,digito,cliente_numero FROM conta_corrente;
SELECT id,nome FROM tipo_transação;
SELECT banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,valor FROM cliente_transacoes;

SELECT COUNT(1) FROM banco; --151 bancos
SELECT COUNT(1) FROM agencia; --296 agencias
SELECT 1 FROM agencia; --trás 1 em todos os registros
--SELECT COUNT(id) ajuda,mas (1) é melhor

--ele coloca COUNT(1) e não asterisco pois ele só quer contar o número de registros que ele retornará

--296 registros
SELECT banco.numero,banco.nome,agencia.numero,agencia.nome
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;

SELECT banco.numero
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero
GROUP BY banco.numero;

--9
SELECT count (distinct banco.numero)
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;

--438
SELECT banco.numero, banco.nome,agencia.numero,agencia.nome
FROM banco
LEFT JOIN agencia ON agencia.banco_numero = banco.numero;
--retornou todos os bancos que possuem relacionamento com as agencias e todos sem relaçao nenhuma
--depois do 296 é só nulo

--438
SELECT agencia.numero,agencia.nome,banco.numero, banco.nome
FROM agencia
RIGHT JOIN banco ON  banco.numero = agencia.banco_numero ;
--depois do 296,null
--só funcionou pq invertemos as tabelas

--293?
SELECT agencia.numero,agencia.nome,banco.numero, banco.nome
FROM agencia
LEFT JOIN banco ON  banco.numero = agencia.banco_numero;

--434?
SELECT banco.numero,banco.nome,agencia.numero,agencia.nome
FROM banco
FULL JOIN agencia ON  agencia.banco_numero = banco.numero;
--Funciona como o LEFT JOIN

CREATE TABLE IF NOT EXISTS teste_a(id serial primary key, valor varchar(10));
CREATE TABLE IF NOT EXISTS teste_b(id serial primary key, valor varchar(10));
 
INSERT INTO teste_a (valor) VALUES ('teste1');
INSERT INTO teste_a (valor) VALUES ('teste2');
INSERT INTO teste_a (valor) VALUES ('teste3');
INSERT INTO teste_a (valor) VALUES ('teste4');

INSERT INTO teste_b (valor) VALUES ('teste_a');
INSERT INTO teste_b (valor) VALUES ('teste_b');
INSERT INTO teste_b (valor) VALUES ('teste_c');
INSERT INTO teste_b (valor) VALUES ('teste_d');

SELECT tbla.valor, tblb.valor
FROM teste_a tbla
CROSS JOIN teste_b tblb;

DROP TABLE IF EXISTS teste_a;
DROP TABLE IF EXISTS teste_b;

SELECT banco.nome,
       agencia.nome,
	   conta_corrente.numero,
       conta_corrente.digito,
	   cliente.nome
FROM banco 
JOIN agencia ON agencia.banco_numero = banco.numero
JOIN conta_corrente
   --ON conta_corrente.banco_numero = agencia.banco_numero
    ON conta_corrente.banco_numero = banco.numero
	AND conta_corrente.agencia_numero = agencia.numero
JOIN cliente
   ON cliente.numero = conta_corrente.cliente_numero;
--join entre 4 tabelas


-----------------------------------------------------------------------
SELECT numero,nome FROM  banco;
SELECT banco_numero, numero, nome FROM agencia;

WITH tbl_tmp_banco AS (
  SELECT numero, nome
  FROM banco	
)
SELECT numero, nome
FROM tbl_tmp_banco;

WITH params AS (
  SELECT 213 AS banco_numero
),tbl_tmp_banco AS(
  SELECT numero, nome 
  FROM banco	
  JOIN params ON params.banco_numero = banco_numero	
)
SELECT numero, nome
FROM tbl_tmp_banco;

SELECT banco.numero, banco.nome
FROM banco
JOIN(
  SELECT 213 AS banco_numero
) params ON params.banco_numero = banco.numero;


WITH clientes_e_transacoes AS (
SELECT cliente.nome AS cliente_nome,
	    tipo_transacao.nome AS  tipo_transacao_nome,
        cliente_transacoes.valor AS  tipo_transacao_valor
FROM cliente_transacoes
JOIN cliente ON cliente.numero = cliente_transacoes.cliente_numero
JOIN tipo_transacao ON tipo_transacao.id = cliente_transacoes.tipo_transacao_id	
) --esse SELECT abaixo é a query que a minha aplicação utilizará,então não vai mudar os campos
SELECT cliente_nome, tipo_transacao_nome, tipo_transacao_valor
FROM clientes_e_transacoes;


WITH clientes_e_transacoes AS (
SELECT cliente.nome AS cliente_nome,
	    tipo_transacao.nome AS  tipo_transacao_nome,
        cliente_transacoes.valor AS  tipo_transacao_valor
FROM cliente_transacoes
JOIN cliente ON cliente.numero = cliente_transacoes.cliente_numero
JOIN tipo_transacao ON tipo_transacao.id = cliente_transacoes.tipo_transacao_id	
JOIN banco ON banco.numero = cliente_transacoes.banco_numero AND banco.nome ILIKE '%Itau%'
)
SELECT cliente_nome, tipo_transacao_nome, tipo_transacao_valor
FROM clientes_e_transacoes;



























