REM   Projeto Logico usando o Modelo Relacional do Oracle - Script SQL-DDL
REM   Grupo: Gabriel Souto Maracaja, Gilvan Neto, Lucas Fernandes de Oliveira, Pedro Henrique Costa, Raquel Rufino e Victor Emanuel Farias

#01. Crie uma vis�o que liste os valores de chuva di�rios do m�s atual e o nome do usu�rio respons�vel pela medi��o.

CREATE VIEW infoChuvas
	AS SELECT m.valor_chuva_dia, u.nome
	FROM medicao_pluviometrica m, usuario u,
	WHERE m.matricula = u.matricula

#02. Liste os nomes dos postos pluviom�tricos e seu munic�pio, agrupados pelo munic�pio.

SELECT nome, municipio
FROM posto_pluviometrico
GROUP BY municipio

#03. Fa�a um trigger que n�o permita a inser��o de uma medi��o de cota di�ria de um a�ude para uma data posterior a data atual.


#04. Liste o nome da esta��es de qualidade que mediram informa��es de rios da Para�ba ou do Cear�.

SELECT e.nome
FROM estacaoDeQualidade e, rio r, posto_pluviometrico p
WHERE e.id_rio = r.id_rio AND p.id_bacia = r.id_bacia AND p.estado = "Para�ba"
UNION
SELECT e.nome
FROM estacaoDeQualidade e, rio r, posto_pluviometrico p
WHERE e.id_rio = r.id_rio AND p.id_bacia = r.id_bacia AND p.estado = "Cear�"

#05. Crie uma vis�o que liste, para todos os a�udes, seu nome e os valores de ph, dbo, turbidez, oxig�nio, alcalinidade e a data de medi��es que foram feitas no m�s atual.

CREATE VIEW InfoAcude
	AS SELECT r.nome, e.pH_rio, e.DBO_rio, e.turbidez_rio, e.oxigenio_rio, e.alcalinidade_rio, e.data_medicao_acude,
	FROM rio r, estacaoDeQualidade e
	WHERE r.id_rio = e.id_rio

	

#06. Liste os valores de oxig�nio medidos para o Rio Para�ba entre os dias 02/07/2017 e 02/08/2017.

SELECT e.oxigenio_rio
FROM estacaoDeQualidade e, rio r
WHERE r.id_rio = e.id_rio AND r.nome = "Rio Para�ba" AND data_medicao_rio BETWEEN "2017-07-02" AND "2017-08-02"

#07. Liste o nome das esta��es de qualidade, ordenadas pelo c�digo da esta��o e por seu nome de forma crescente.

SELECT nome
FROM estacaoDeQualidade
GROUP BY id_estacao
ORDER BY nome ASC

#08. Liste a quantidade de medi��es de cota di�ria feitas por a�ude.

SELECT a.nome , COUNT(m.*)
FROM acude a, medicao_cota_diaria m
WHERE a.id_acude = m.id_acude
GROUP BY a.nome

#09. Liste os nomes dos a�udes e o nome do rio pertencente, agrupados pelo nome do rio.

SELECT a.nome, r.nome
FROM acude a, rio r
WHERE r.idRio = a.idRio
GROUP BY r.nome

#10. Fa�a um trigger que, ao tentar inserir um valor de chuva negativo, o valor inserido seja 0.


#11. Qual foi o valor total de chuvas no a�ude de Coremas para os meses de Dezembro/2017 e Janeiro/2018 ?

SELECT SUM(m.valor_chuva_dia)
FROM medicao_pluviometrica m, acude a
WHERE a.idAcude = m.idAcude AND a.nome = "Coremas" AND m.data BETWEEN "2017-12-01" AND "2018-01-31" 

#12. Qual o nome do usu�rio que mais realizou medi��es de cotas di�rias, e quantas foram?.

SELECT u.nome, COUNT(m.*)
FROM usuario u, medicao_cota_diaria m
WHERE m.matricula = u.matricula
GROUP BY u.nome
HAVING MAX(COUNT(m.*))

#13. Liste os valores de pH pro a�ude de Bodocong�, ordenadas de forma decrescente.

SELECT e.pH_acude
FROM estacaoDeQualidade e, acude a
WHERE e.idAcude = a.idAcude AND a.nome = "Bodocong�"
ORDER BY e.pH_acude DESC

#14. Liste o nome dos usu�rios que n�o cadastraram nenhuma medi��o, seja ela pluviom�trica ou de cota di�ria.

SELECT u.nome
FROM usuario u, medicao_pluviometrica p, medicao_cota_diaria c
WHERE NOT EXISTS (SELECT u.matricula
                  FROM medicao_pluviometrica pp
                  WHERE u.matricula = pp.matricula
                  UNION
                  SELECT u.matricula
                  FROM medicao_cota_diara cc
                  WHERE u.matricula = cc.matricula)       
                
#15. Qual o a�ude com o menor comprimento?

SELECT a.nome
FROM acude a
WHERE a.comprimento = (SELECT MIN(a.comprimento)
                        FROM acude a)
