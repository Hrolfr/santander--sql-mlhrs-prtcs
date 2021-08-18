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

CREATE TABLE IF NOT EXISTS banco(
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

CREATE TABLE cliente (
  numero BIGSERIAL PRIMARY KEY,
  nome VARCHAR(120) NOT NULL,
  email VARCHAR(250) NOT NULL,
  ativo BOOLEAN NOT NULL DEFAULT TRUE,
  data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP	
);

CREATE TABLE conta_corrente (
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

CREATE TABLE tipo_de_transacao(
  id SMALLSERIAL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  ativo BOOLEAN NOT NULL DEFAULT TRUE,
  data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP	
);

CREATE TABLE cliente_transacoes (
  id BIGSERIAL PRIMARY KEY,
  banco_numero INTEGER NOT NULL,
  agencia_numero INTEGER NOT NULL,
  conta_corrente_numero BIGINT NOT NULL,
  conta_corrente_digito SMALLINT NOT NULL,
  cliente_numero BIGINT NOT NULL,
  tipo_transacao_id SMALLINT NOT NULL,
  valor NUMERIC(15,2) NOT NULL,
  data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero) REFERENCES conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero)
);