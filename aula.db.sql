DROP ROLE daniel;

CREATE TABLE teste (nome varchar);
GRANT ALL ON TABLE teste TO professores;
CREATE ROLE daniel LOGIN PASSWORD '123';
CREATE ROLE daniel INHERIT LOGIN PASSWORD '123' IN ROLE professores;

REVOKE professores FROM daniel;
---------------------------------------------------------------------
Paralelo com o finanças: 

CREATE TABLE IF NOT EXISTS funcionarios(
 id SERIAL,
 nome VARCHAR(50),
 gerente INTEGER,
 PRIMARY KEY(id),
 FOREIGN KEY (gerente )REFERENCES funcionarios(id)	
);

INSERT INTO funcionarios (nome,gerente) VALUES ('Ancelmo',null);
INSERT INTO funcionarios (nome,gerente) VALUES ('Beatriz',1);
INSERT INTO funcionarios (nome,gerente) VALUES ('Magno',1);
INSERT INTO funcionarios (nome,gerente) VALUES ('Cremilda',2);
INSERT INTO funcionarios (nome,gerente) VALUES ('Wagner',4);

SELECT id,nome,gerente FROM funcionarios WHERE gerente IS NULL
UNION ALL
SELECT id,nome,gerente FROM funcionarios WHERE id = 999;
--Tudo junto retorna só o ancelmo,pois o segundo selectnão retorna nada.Funciona como a view recursiva 
--Separado é vazio

CREATE OR REPLACE RECURSIVE VIEW vw_func(id,gerente,funcionario) AS (
  SELECT id,gerente,nome
  FROM funcionarios
  WHERE gerente IS NULL
 --só com o miolo devolve o 1,null e Ancelmo

UNION ALL
SELECT funcionarios.id,funcionarios.gerente,funcionarios.nome 
FROM funcionarios 
JOIN vw_func ON vw_func.id = funcionarios.gerente
);

--Na primeira vez que for executada a consulta, SELECT funcionarios será nulo,pois é como se a view não fosse
--executada.Mas como ele faz um JOIN com a view, ela passa a se chamar até zerarem as opções da tabela.

SELECT id,gerente,funcionario 
FROM vw_func;









