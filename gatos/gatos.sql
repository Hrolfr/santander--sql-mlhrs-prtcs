CREATE TABLE IF NOT EXISTS cores(
  cor VARCHAR(50) PRIMARY KEY,
  ativo BOOLEAN NOT NULL DEFAULT TRUE	
);

INSERT INTO cores (cor) VALUES ('amarelo');
INSERT INTO cores (cor) VALUES ('bicolor');
INSERT INTO cores (cor) VALUES ('branco');
INSERT INTO cores (cor) VALUES ('cinza');
INSERT INTO cores (cor) VALUES ('marrom');
INSERT INTO cores (cor) VALUES ('preto');
INSERT INTO cores (cor) VALUES ('tricolor');
INSERT INTO cores (cor) VALUES ('rosa');
INSERT INTO cores (cor) VALUES ('amarelo-alaranjado');
INSERT INTO cores (cor) VALUES ('trigo-escuro');


CREATE TABLE IF NOT EXISTS tamanho(
   tamanho VARCHAR(10) PRIMARY KEY,
   ativo BOOLEAN NOT NULL DEFAULT TRUE	
);

INSERT INTO tamanho (tamanho) VALUES ('pequeno');
INSERT INTO tamanho (tamanho) VALUES ('médio');
INSERT INTO tamanho (tamanho) VALUES ('grande');
INSERT INTO tamanho (tamanho) VALUES ('enorme');


CREATE TABLE IF NOT EXISTS gatos (
  racas VARCHAR(50),	
  cor_gato VARCHAR(50),
  tamanho_gato VARCHAR(50),	
  ativo BOOLEAN NOT NULL DEFAULT TRUE,	
  PRIMARY KEY (racas,cor_gato,tamanho_gato),
  FOREIGN KEY (cor_gato) REFERENCES cores (cor),
  FOREIGN KEY (tamanho_gato) REFERENCES tamanho (tamanho)	
);

INSERT INTO gatos (racas,cor_gato,tamanho_gato) VALUES ('siames', 'tricolor', 'médio');
INSERT INTO gatos (racas,cor_gato,tamanho_gato) VALUES ('siames', 'tricolor', 'grande');
INSERT INTO gatos (racas,cor_gato,tamanho_gato) VALUES ('siames', 'tricolor', 'pequeno');
INSERT INTO gatos (racas,cor_gato,tamanho_gato) VALUES ('ragamuffin', 'tricolor', 'pequeno');
INSERT INTO gatos (racas,cor_gato,tamanho_gato) VALUES ('ragamuffin', 'tricolor', 'médio');
INSERT INTO gatos (racas,cor_gato,tamanho_gato) VALUES ('ragamuffin', 'tricolor', 'grande');
INSERT INTO gatos (racas,cor_gato,tamanho_gato) VALUES ('caracat', 'trigo-escuro', 'pequeno');
INSERT INTO gatos (racas,cor_gato,tamanho_gato) VALUES ('caracat', 'trigo-escuro', 'médio');
INSERT INTO gatos (racas,cor_gato,tamanho_gato) VALUES ('caracat', 'trigo-escuro', 'grande');
INSERT INTO gatos (racas,cor_gato,tamanho_gato) VALUES ('maine-coon', 'tricolor', 'enorme');
INSERT INTO gatos (racas,cor_gato,tamanho_gato) VALUES ('maine-coon', 'branco', 'enorme');
INSERT INTO gatos (racas,cor_gato,tamanho_gato) VALUES ('maine-coon', 'marrom', 'enorme');
INSERT INTO gatos (racas,cor_gato,tamanho_gato) VALUES ('maine-coon', 'cinza', 'enorme');
INSERT INTO gatos (racas,cor_gato,tamanho_gato) VALUES ('sphynx', 'rosa', 'pequeno');
INSERT INTO gatos (racas,cor_gato,tamanho_gato) VALUES ('sphynx', 'rosa', 'médio');
INSERT INTO gatos (racas,cor_gato,tamanho_gato) VALUES ('sphynx', 'rosa', 'grande');
INSERT INTO gatos (racas,cor_gato,tamanho_gato) VALUES ('teste', 'preto', 'grande');

DELETE FROM gatos WHERE cor_gato = 'marrom';
DELETE FROM gatos WHERE cor_gato = 'rosa';

CREATE OR REPLACE VIEW vw_gato AS (
  SELECT racas,cor_gato, tamanho_gato
  FROM gatos
);

SELECT racas,cor_gato, tamanho_gato 
FROM vw_gato;

SELECT cor_gato, tamanho_gato, racas
FROM gatos WHERE cor_gato = 'rosa';

SELECT racas, tamanho_gato
FROM gatos WHERE tamanho_gato = 'enorme'; --funciona

SELECT cor_gato FROM gatos WHERE cor_gato = 'rosa'; --funciona

-- DELETE com WHERE, SELECT com WHERE, UPDATE (COM WHERE), ON CONFLICT, falta o LOXAL CHECK OPTION

UPDATE gatos SET
cor_gato = 'branco'
WHERE racas = 'teste';

SELECT racas FROM gatos WHERE tamanho_gato = 'enorme'; 

INSERT INTO cores (cor) VALUES ('leute');
DELETE FROM cores WHERE cor = 'leute';

-- ON CONFLICT
CREATE OR REPLACE VIEW vw_gatinhos AS (
  SELECT racas,cor_gato, tamanho_gato, ativo
  FROM gatos
);

INSERT INTO vw_gatinhos (racas, cor_gato, tamanho_gato) VALUES ('caracat', 'trigo-escuro', 'pequeno')
ON CONFLICT DO NOTHING; --aeeee kkkkkkkkkkkkk 
--trás o INSERT 0 0 
--

CREATE TABLE IF NOT EXISTS mistura_teste (
  cor VARCHAR(50),
  ativo BOOLEAN NOT NULL DEFAULT TRUE
);

DROP TABLE mistura_teste;

INSERT INTO mistura_teste (cor) VALUES ('amarelo');
INSERT INTO mistura_teste (cor) VALUES ('bicolor');
INSERT INTO mistura_teste (cor) VALUES ('branco');
INSERT INTO mistura_teste (cor) VALUES ('cinza');
INSERT INTO mistura_teste (cor) VALUES ('marrom');
INSERT INTO mistura_teste (cor) VALUES ('preto');
INSERT INTO mistura_teste (cor) VALUES ('tricolor');
INSERT INTO mistura_teste (cor) VALUES ('rosa');
INSERT INTO mistura_teste (cor) VALUES ('amarelo-alaranjado');
INSERT INTO mistura_teste (cor) VALUES ('trigo-escuro');
INSERT INTO mistura_teste (cor) VALUES ('amarelo');
INSERT INTO mistura_teste (cor) VALUES ('bicolor');
INSERT INTO mistura_teste (cor) VALUES ('branco');
INSERT INTO mistura_teste (cor) VALUES ('cinza');
INSERT INTO mistura_teste (cor) VALUES ('marrom');
INSERT INTO mistura_teste (cor) VALUES ('preto');
INSERT INTO mistura_teste (cor) VALUES ('tricolor');
INSERT INTO mistura_teste (cor) VALUES ('rosa');
INSERT INTO mistura_teste (cor) VALUES ('amarelo-alaranjado');
INSERT INTO mistura_teste (cor) VALUES ('trigo-escuro');
INSERT INTO mistura_teste (cor) VALUES ('amarelo');
INSERT INTO mistura_teste (cor) VALUES ('bicolor');
INSERT INTO mistura_teste (cor) VALUES ('branco');
INSERT INTO mistura_teste (cor) VALUES ('cinza');
INSERT INTO mistura_teste (cor) VALUES ('marrom');
INSERT INTO mistura_teste (cor) VALUES ('preto');
INSERT INTO mistura_teste (cor) VALUES ('tricolor');
INSERT INTO mistura_teste (cor) VALUES ('rosa');
INSERT INTO mistura_teste (cor) VALUES ('amarelo-alaranjado');
INSERT INTO mistura_teste (cor) VALUES ('trigo-escuro');

SELECT cor FROM mistura_teste; 

TRUNCATE mistura_teste CASCADE; --certinho