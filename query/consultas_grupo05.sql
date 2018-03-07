REM   Projeto Logico usando o Modelo Relacional do Oracle - Script SQL-DDL
REM   Grupo: Gabriel Souto Maracaja, Gilvan Neto, Lucas Fernandes de Oliveira, Pedro Henrique Costa, Raquel Rufino e Victor Emanuel Farias

#01. Crie uma visão que liste os valores de chuva diários do mês atual e o nome do usuário responsável pela medição.

CREATE VIEW infoChuvas
	AS SELECT m.valor_chuva_dia, u.nome
	FROM medicao_pluviometrica m, usuario u,
	WHERE m.matricula = u.matricula

#02. Liste os nomes dos postos pluviométricos e seu município, agrupados pelo município.

SELECT nome, municipio
FROM posto_pluviometrico
GROUP BY municipio

#03. Faça um trigger que não permita a inserção de uma medição de cota diária de um açude para uma data posterior a data atual.


#04. Liste o nome da estações de qualidade que mediram informações de rios da Paraíba ou do Ceará.

SELECT e.nome
FROM estacaoDeQualidade e, rio r, posto_pluviometrico p
WHERE e.id_rio = r.id_rio AND p.id_bacia = r.id_bacia AND p.estado = "Paraíba"
UNION
SELECT e.nome
FROM estacaoDeQualidade e, rio r, posto_pluviometrico p
WHERE e.id_rio = r.id_rio AND p.id_bacia = r.id_bacia AND p.estado = "Ceará"

#05. Crie uma visão que liste, para todos os açudes, seu nome e os valores de ph, dbo, turbidez, oxigênio, alcalinidade e a data de medições que foram feitas no mês atual.

CREATE VIEW InfoAcude
	AS SELECT r.nome, e.pH_rio, e.DBO_rio, e.turbidez_rio, e.oxigenio_rio, e.alcalinidade_rio, e.data_medicao_acude,
	FROM rio r, estacaoDeQualidade e
	WHERE r.id_rio = e.id_rio

	

#06. Liste os valores de oxigênio medidos para o Rio Paraíba entre os dias 02/07/2017 e 02/08/2017.

SELECT e.oxigenio_rio
FROM estacaoDeQualidade e, rio r
WHERE r.id_rio = e.id_rio AND r.nome = "Rio Paraíba" AND data_medicao_rio BETWEEN "2017-07-02" AND "2017-08-02"

#07. Liste o nome das estações de qualidade, ordenadas pelo código da estação e por seu nome de forma crescente.

SELECT nome
FROM estacaoDeQualidade
GROUP BY id_estacao
ORDER BY nome ASC

#08. Liste a quantidade de medições de cota diária feitas por açude.

SELECT a.nome , COUNT(m.*)
FROM acude a, medicao_cota_diaria m
WHERE a.id_acude = m.id_acude
GROUP BY a.nome

#09. Liste os nomes dos açudes e o nome do rio pertencente, agrupados pelo nome do rio.

SELECT a.nome, r.nome
FROM acude a, rio r
WHERE r.idRio = a.idRio
GROUP BY r.nome

#10. Faça um trigger que, ao tentar inserir um valor de chuva negativo, o valor inserido seja 0.


#11. Qual foi o valor total de chuvas no açude de Coremas para os meses de Dezembro/2017 e Janeiro/2018 ?

SELECT SUM(m.valor_chuva_dia)
FROM medicao_pluviometrica m, acude a
WHERE a.idAcude = m.idAcude AND a.nome = "Coremas" AND m.data BETWEEN "2017-12-01" AND "2018-01-31" 

#12. Qual o nome do usuário que mais realizou medições de cotas diárias, e quantas foram?.

SELECT u.nome, COUNT(m.*)
FROM usuario u, medicao_cota_diaria m
WHERE m.matricula = u.matricula
GROUP BY u.nome
HAVING MAX(COUNT(m.*))

#13. Liste os valores de pH pro açude de Bodocongó, ordenadas de forma decrescente.

SELECT e.pH_acude
FROM estacaoDeQualidade e, acude a
WHERE e.idAcude = a.idAcude AND a.nome = "Bodocongó"
ORDER BY e.pH_acude DESC

#14. Liste o nome dos usuários que não cadastraram nenhuma medição, seja ela pluviométrica ou de cota diária.

SELECT u.nome
FROM usuario u, medicao_pluviometrica p, medicao_cota_diaria c
WHERE NOT EXISTS (SELECT u.matricula
                  FROM medicao_pluviometrica pp
                  WHERE u.matricula = pp.matricula
                  UNION
                  SELECT u.matricula
                  FROM medicao_cota_diara cc
                  WHERE u.matricula = cc.matricula)       
                
#15. Qual o açude com o menor comprimento?

SELECT a.nome
FROM acude a
WHERE a.comprimento = (SELECT MIN(a.comprimento)
                        FROM acude a)
