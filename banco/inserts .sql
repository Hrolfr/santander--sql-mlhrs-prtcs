INSERT INTO banco (numero,nome) VALUES ('000', 'Banco Amendoin'::VARCHAR(50)); --
INSERT INTO banco (numero,nome) VALUES ('001', 'Banco Amora'::VARCHAR(50));--
INSERT INTO banco (numero,nome) VALUES ('002', 'Banco Antítese'::VARCHAR(50));--
INSERT INTO banco (numero,nome) VALUES ('003', 'Banco Andra'::VARCHAR(50));--
INSERT INTO banco (numero,nome) VALUES ('004', 'Banco Asteca'::VARCHAR(50));--
INSERT INTO banco (numero,nome) VALUES ('005', 'Banco Assandre'::VARCHAR(50));--
INSERT INTO banco (numero,nome) VALUES ('006', 'Banco Bacana'::VARCHAR(50));--
INSERT INTO banco (numero,nome) VALUES ('007', 'Banco Bang'::VARCHAR(50));--
INSERT INTO banco (numero,nome) VALUES ('081', 'Banco Batata'::VARCHAR(50));--
INSERT INTO banco (numero,nome) VALUES ('009', 'Banco Binder'::VARCHAR(50));--
INSERT INTO banco (numero,nome) VALUES ('010', 'Banco Bus'::VARCHAR(50));--
INSERT INTO banco (numero,nome) VALUES ('011', 'Banco Carter'::VARCHAR(50));--
INSERT INTO banco (numero,nome) VALUES ('012', 'Banco Ciello'::VARCHAR(50));--
INSERT INTO banco (numero,nome) VALUES ('013', 'Banco Conquer'::VARCHAR(50));--
INSERT INTO banco (numero,nome) VALUES ('014', 'Banco Corolla'::VARCHAR(50));--
INSERT INTO banco (numero,nome) VALUES ('015', 'Banco Corn'::VARCHAR(50));
INSERT INTO banco (numero,nome) VALUES ('016', 'Banco Canvas'::VARCHAR(50));

INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,1,'Agência número 1 do banco Banco Amendoin');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,2,'Agência número 2 do banco Banco Amora');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,3,'Agência número 3 do banco Banco Antítese');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,4,'Agência número 4 do banco Banco Andra');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,5,'Agência número 5 do banco Banco Asteca');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,6,'Agência número 6 do banco Banco Assandre');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,7,'Agência número 7 do banco Banco Bacana');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,8,'Agência número 8 do banco Banco Bang');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,9,'Agência número 9 do banco Batata');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,10,'Agência número 10 do banco  Binder');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,11,'Agência número 11 do banco Bus');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,12,'Agência número 12 do banco Banco Carter');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,13,'Agência número 13 do banco Banco Ciello');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,14,'Agência número 14 do banco Banco Conquer');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,15,'Agência número 15 do banco Banco Corolla');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,16,'Agência número 16 do banco Banco Corn');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,17,'Agência número 17 do banco Banco Canvas');

INSERT INTO cliente (nome, email) VALUES ('Adelina Neves','adelinalina_neves@usa.net'); 
INSERT INTO cliente (nome, email) VALUES ('Gustavo Felgueiras','gustavo_felgueiras@hermanos.com.ar'); 
INSERT INTO cliente (nome, email) VALUES ('Ricardo Garcés','ricardo_garces@discovery.channel.com');
INSERT INTO cliente (nome, email) VALUES ('Adélia Sobral','adelia_sobral@usa.net');
INSERT INTO cliente (nome, email) VALUES ('Zenaide Peçanha','zenaide_pecanha@vaildochaves.com.mx');
INSERT INTO cliente (nome, email) VALUES ('Sabrina SantAnna','sabrina_santanna@vaildochaves.com.mx');
INSERT INTO cliente (nome, email) VALUES ('Eduardo Rua','eduardo_rua@samba.br');
INSERT INTO cliente (nome, email) VALUES ('Cesário Brião','cesario_briao@sertanejo.com.br');
INSERT INTO cliente (nome, email) VALUES ('Alexandra Ramírez','alexandra_ramirez@hbo.com');
INSERT INTO cliente (nome, email) VALUES ('Luzia Rivas','luzia_rivas@globo.com');
INSERT INTO cliente (nome, email) VALUES ('Cristiano Quinteiro','cristiano_quinteiro@linux.com');
INSERT INTO cliente (nome, email) VALUES ('Ofélia Cerveira','ofelia_cerveira@record.com.br');
INSERT INTO cliente (nome, email) VALUES ('Elvira Guimarães','elvira_guimaraes@heavy.metal.com');
INSERT INTO cliente (nome, email) VALUES ('Hélia Fortunato','helia_fortunato@discovery.channel.com');
INSERT INTO cliente (nome, email) VALUES ('Eloi Casqueira','eloi_casqueira@linux.com');
INSERT INTO cliente (nome, email) VALUES ('Alberta Araripe','alberta_araripe@hotmail.com');
INSERT INTO cliente (nome, email) VALUES ('Adosindo Suaçuna','adosindo_suacuna@marvel.com');
INSERT INTO cliente (nome, email) VALUES ('Rebeca Pérez','rebeca_perez@linux.com');

INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,2,187511463,1,300);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,2,400962468,2,348);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,2,409112000,2,289);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,3,198474553,7,376);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,4,414448303,0,328);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,4,11857381,6,240);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,5,371047745,5,379);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,5,225616342,3,119);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,5,15140549,8,331);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,6,193291495,2,282);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,7,89940236,1,340);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,7,168215886,1,156);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,8,295739455,5,444);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,9,402464325,6,88);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,9,59256727,5,339);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,10,11718435,5,182);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,12,343925259,8,56);

INSERT INTO tipo_transacao (nome) VALUES ('Débito');
INSERT INTO tipo_transacao (nome) VALUES ('Crédito');
INSERT INTO tipo_transacao (nome) VALUES ('Transferência');
INSERT INTO tipo_transacao (nome) VALUES ('Empréstimo');

INSERT INTO cliente_transacoes (banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (247,30,424222306,8,208,3, 0.87);
INSERT INTO cliente_transacoes (banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (104,12,203989772,8,65,3, 1.61);
INSERT INTO cliente_transacoes (banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (655,4,14118439,3,454,3, 1.73);
INSERT INTO cliente_transacoes (banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (247,12,278633277,7,177,3, 1.82);
INSERT INTO cliente_transacoes (banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (104,49,282599295,4,325,3, 2.22);
INSERT INTO cliente_transacoes (banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (33,20,312103822,7,375,3, 2.51);
INSERT INTO cliente_transacoes (banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (623,4,203580474,6,306,3, 2.56);
INSERT INTO cliente_transacoes (banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (33,15,295186051,0,77,3, 3.06);
INSERT INTO cliente_transacoes (banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (237,3,215637901,0,262,3, 3.46);
INSERT INTO cliente_transacoes (banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (33,10,256786009,3,43,3, 3.65);
INSERT INTO cliente_transacoes (banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (104,11,362325544,4,135,3, 3.97);
INSERT INTO cliente_transacoes (banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (104,49,246690806,8,359,3, 4.68);
INSERT INTO cliente_transacoes (banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (399,19,25574239,0,480,3, 5.21);
INSERT INTO cliente_transacoes (banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (655,4,311520744,1,409,3, 5.33);
INSERT INTO cliente_transacoes (banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (104,57,64421435,4,311,3, 5.68);
INSERT INTO cliente_transacoes (banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (104,67,258044064,4,212,3, 6.81);
INSERT INTO cliente_transacoes (banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (247,31,143117142,6,245,3, 7.09);








