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