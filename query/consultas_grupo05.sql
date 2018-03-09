-- Consultas

--01. Crie uma visão que liste os valores de chuva diários do mês atual e o nome do usuário responsável pela medição.

CREATE VIEW infoChuvas
	AS SELECT m.valor_chuva_dia, u.nome
	FROM medicao_pluviometrica m, usuario u
	WHERE m.matricula = u.matricula AND TO_CHAR(m.data_medicao, 'MM-YYYY') = TO_CHAR(SYSDATE, 'MM-YYYY');

--02. Liste os nomes dos postos pluviométricos e seu município, agrupados pelo município.

SELECT p.nome, p.municipio
FROM posto_pluviometrico p
GROUP BY p.municipio, p.nome;

--04. Liste o nome da estações de qualidade que mediram informações de rios da Paraíba ou do Ceará.

SELECT e.nome
FROM estacaoDeQualidade e, rio r, posto_pluviometrico p
WHERE e.id_rio = r.id_rio AND p.id_bacia = r.id_bacia AND (p.estado = 'PB' OR p.estado = 'CE');

--05. Crie uma visão que liste, para todos os açudes, seu nome e os valores de ph, dbo, turbidez, oxigênio, alcalinidade e a data de medições que foram feitas no mês atual.

CREATE VIEW InfoAcude
	AS SELECT a.nome, e.pH_acude, e.DBO_acude, e.turbidez_acude, e.oxigenio_acude, e.alcalinidade_acude, e.data_medicao_acude
	FROM acude a, estacaoDeQualidade e
	WHERE a.id_acude = e.id_acude AND TO_CHAR(e.data_medicao_acude, 'MM-YYYY') = TO_CHAR(SYSDATE, 'MM-YYYY');

--06. Liste os valores de oxigênio medidos para o Rio Paraíba entre os dias 02/07/2017 e 02/08/2017.

SELECT e.oxigenio_rio AS oxigenio_rio_paraiba, e.data_medicao_rio
FROM estacaoDeQualidade e, rio r
WHERE r.id_rio = e.id_rio AND r.nome = 'Rio Paraíba' AND e.data_medicao_rio BETWEEN '07-02-2017' AND '08-02-2017';

--07. Liste o nome das estações de qualidade, ordenadas pelo código da estação e por seu nome de forma crescente.

SELECT nome
FROM estacaoDeQualidade
ORDER BY id_estacao_qualidade ASC, nome ASC;

--08. Liste a quantidade de medições de cota diária feitas por açude.

SELECT a.nome , COUNT(*) AS qte_medicoes
FROM acude a, medicao_cota_diaria m
WHERE a.id_acude = m.id_acude
GROUP BY a.nome;

--09. Liste os nomes dos açudes e o nome do rio pertencente, agrupados pelo nome do rio.

SELECT a.nome, r.nome
FROM acude a, rio r
WHERE r.id_rio = a.id_rio
GROUP BY r.nome, a.nome;

--11. Qual foi o valor total de chuvas no açude de Coremas para os meses de Dezembro/2017 e Janeiro/2018 ?

SELECT SUM(m.cota_atual) AS total_chuvas_acude_coremas
FROM medicao_cota_diaria m, acude a
WHERE a.id_acude = m.id_acude AND a.nome = 'Coremas' AND m.data_medicao BETWEEN '12-01-2017' AND '01-31-2018';

--12. Qual o nome do usuário que mais realizou medições de cotas diárias, e quantas foram?.

SELECT *
FROM (SELECT u.nome, COUNT(*) AS qte_medicoes
      FROM usuario u, medicao_cota_diaria m
      WHERE u.matricula = m.matricula
      GROUP BY u.nome
      ORDER BY qte_medicoes DESC)
WHERE ROWNUM = 1;

--13. Liste os valores de pH pro açude de Bodocongó, ordenadas de forma decrescente.

SELECT e.pH_acude AS pH_acude_bodocongo
FROM estacaoDeQualidade e, acude a
WHERE e.id_acude = a.id_acude AND a.nome = 'Bodocongó'
ORDER BY e.pH_acude DESC;

--14. Liste o nome dos usuários que não cadastraram nenhuma medição, seja ela pluviométrica ou de cota diária.

SELECT u.nome AS nao_cadastraram_medicao
FROM usuario u
WHERE NOT EXISTS (SELECT u.matricula
                  FROM medicao_pluviometrica pp, medicao_cota_diaria cc
                  WHERE u.matricula = pp.matricula OR u.matricula = cc.matricula);
                
--15. Qual o açude com o menor comprimento?

SELECT a.nome AS acude_com_menor_comprimento
FROM acude a
WHERE a.comprimento = (SELECT MIN(a.comprimento)
                        FROM acude a);
