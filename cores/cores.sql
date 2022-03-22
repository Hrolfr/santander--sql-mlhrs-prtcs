CREATE TABLE IF NOT EXISTS primaria (
  cor VARCHAR(50) PRIMARY KEY	
);

INSERT INTO primaria (cor) VALUES ('amarelo' ::VARCHAR(50));
INSERT INTO primaria (cor) VALUES ('azul' ::VARCHAR(50));
INSERT INTO primaria (cor) VALUES ('vermelho' ::VARCHAR(50));
INSERT INTO primaria (cor) VALUES ('magenta' ::VARCHAR(50));


CREATE TABLE IF NOT EXISTS secundaria (
  cor_primaria VARCHAR(50) NOT NULL,
  cor_prima VARCHAR(50) NOT NULL,
  mistura VARCHAR(50) NOT NULL,	
  PRIMARY KEY (mistura),
  FOREIGN KEY (cor_primaria) REFERENCES primaria (cor),
  FOREIGN KEY (cor_prima) REFERENCES primaria (cor)
);

--TRUNCATE TABLE primaria CASCADE;

INSERT INTO secundaria (cor_primaria,cor_prima,mistura) VALUES ('amarelo', 'vermelho', 'laranja' ::VARCHAR(50));
INSERT INTO secundaria (cor_primaria,cor_prima,mistura) VALUES ('azul', 'vermelho', 'roxo' ::VARCHAR(50));
INSERT INTO secundaria (cor_primaria,cor_prima,mistura) VALUES ('vermelho', 'azul', 'verde' ::VARCHAR(50));

CREATE TABLE IF NOT EXISTS terciaria (
  cor_primaria VARCHAR(50),
  mistura_secundaria VARCHAR(50),
  resultado VARCHAR(50),
  PRIMARY KEY (cor_primaria,mistura_secundaria,resultado),
  FOREIGN KEY (cor_primaria) REFERENCES primaria (cor),
  FOREIGN KEY (mistura_secundaria) REFERENCES secundaria (mistura)
);

--DROP TABLE terciaria;

INSERT INTO terciaria (cor_primaria,mistura_secundaria,resultado) VALUES ('amarelo', 'laranja', 'amarelo-alaranjado' ::VARCHAR(50));
INSERT INTO terciaria (cor_primaria,mistura_secundaria,resultado) VALUES ('amarelo', 'verde', 'amarelo-esverdeado' ::VARCHAR(50));
INSERT INTO terciaria (cor_primaria,mistura_secundaria,resultado) VALUES ('azul', 'verde', 'azul-esverdeado' ::VARCHAR(50));
INSERT INTO terciaria (cor_primaria,mistura_secundaria,resultado) VALUES ('azul', 'roxo', 'azul-arroxeado' ::VARCHAR(50));
INSERT INTO terciaria (cor_primaria,mistura_secundaria,resultado) VALUES ('vermelho', 'roxo', 'azul-arroxeado' ::VARCHAR(50));
INSERT INTO terciaria (cor_primaria,mistura_secundaria,resultado) VALUES ('amarelo', 'roxo', 'sombra-queimada' ::VARCHAR(50));
INSERT INTO terciaria (cor_primaria,mistura_secundaria,resultado) VALUES ('azul', 'laranja', 'verde-musgo' ::VARCHAR(50));
INSERT INTO terciaria (cor_primaria,mistura_secundaria,resultado) VALUES ('azul', 'roxo', 'azul-marinho' ::VARCHAR(50));
INSERT INTO terciaria (cor_primaria,mistura_secundaria,resultado) VALUES ('magenta', 'laranja', 'magenta-alaranjado' ::VARCHAR(50));
INSERT INTO terciaria (cor_primaria,mistura_secundaria,resultado) VALUES ('magenta', 'roxo', 'magenta-arroxeado' ::VARCHAR(50));
INSERT INTO terciaria (cor_primaria,mistura_secundaria,resultado) VALUES ('vermelho', 'laranja', 'alaranjado' ::VARCHAR(50));
INSERT INTO terciaria (cor_primaria,mistura_secundaria,resultado) VALUES ('vermelho', 'roxo', 'carmin' ::VARCHAR(50));
INSERT INTO terciaria (cor_primaria,mistura_secundaria,resultado) VALUES ('vermelho', 'verde', 'ocre' ::VARCHAR(50));

TRUNCATE TABLE terciarias CASCADE;

CREATE OR REPLACE VIEW vw_misturas AS (
 SELECT cor_primaria,cor_prima,mistura
 FROM primaria, secundaria
); 

SELECT cor_primaria,cor_prima,mistura
FROM vw_misturas;


CREATE OR REPLACE VIEW vw_resultado AS (
 SELECT cor,mistura_secundaria,resultado
 FROM primaria, secundaria, terciaria
); 

SELECT  cor,mistura_secundaria,resultado
FROM vw_resultado;






