CREATE TABLE IF NOT EXISTS teste(
    nome VARCHAR(50),
	cor VARCHAR(50),
	modelo INTEGER NOT NULL,
	ativo BOOLEAN NOT NULL DEFAULT TRUE,
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (nome, cor,modelo)
);

INSERT INTO teste VALUES ('Maca','vermelha',003);
INSERT INTO teste VALUES ('Amora','roxa',001);
INSERT INTO teste VALUES ('Melancia','vermelha',005);
INSERT INTO teste VALUES ('Banana','amarela',002);
INSERT INTO teste VALUES ('Melao','laranja',004);

TRUNCATE TABLE teste CONTINUE IDENTITY

CREATE OR REPLACE TEMPORARY VIEW fruta AS(
   SELECT nome,cor,modelo,ativo
   FROM teste
);

SELECT nome,cor,modelo,ativo
FROM teste
ORDER BY nome DESC;	