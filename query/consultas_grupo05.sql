REM   Projeto Logico usando o Modelo Relacional do Oracle - Script SQL-DDL
REM   Grupo: Gabriel Souto Maracaja, Gilvan Neto, Lucas Fernandes de Oliveira, Pedro Henrique Costa, Raquel Rufino e Victor Emanuel Farias

#02 - finalizado

SELECT nome, municipio
FROM posto_pluviometrico
GROUP BY municipio

#04 - finalizado

SELECT e.nome
FROM estacaoDeQualidade e, rio r, posto_pluviometrico p
WHERE e.id_rio = r.id_rio AND p.id_bacia = r.id_bacia AND p.estado = "Paraíba"
UNION
SELECT e.nome
FROM estacaoDeQualidade e, rio r, posto_pluviometrico p
WHERE e.id_rio = r.id_rio AND p.id_bacia = r.id_bacia AND p.estado = "Ceará"

#06 - finalizado

SELECT e.oxigenio_rio
FROM estacaoDeQualidade e, rio r
WHERE r.id_rio = e.id_rio AND r.nome = "Rio Paraíba" AND data_medicao_rio BETWEEN "2017-07-02" AND "2017-08-02"

#07 - finalizado

SELECT nome
FROM estacaoDeQualidade
GROUP BY id_estacao
ORDER BY nome ASC

#08 - finalizado

SELECT a.nome , COUNT(m.*)
FROM acude a, medicao_cota_diaria m
WHERE a.id_acude = m.id_acude
ORDER BY a.nome ASC

#09 - finalizado

SELECT a.nome, r.nome
FROM acude a, rio r
WHERE r.idRio = a.idRio
GROUP BY r.nome

#11 - finalizado

SELECT SUM(m.valor_chuva_dia)
FROM medicao_pluviometrica m, acude a
WHERE a.idAcude = m.idAcude AND a.nome = "Coremas" AND m.data BETWEEN "2017-12-01" AND "2018-01-31" 

#12 - finalizado

SELECT u.nome, COUNT(m.*)
FROM usuario u, medicao_cota_diaria m
WHERE m.matricula = u.matricula
GROUP BY u.nome
HAVING MAX(COUNT(m.*))

#13 - finalizado

SELECT e.pH_acude
FROM estacaoDeQualidade e, acude a
WHERE e.idAcude = a.idAcude AND a.nome = "Bodocongo"
ORDEE BY e.pH_acude ASC

#14 - finalizado
SELECT u.nome
FROM usuario u, medicao_pluviometrica p, medicao_cota_diaria c
WHERE NOT EXISTS (SELECT u.matricula
                  FROM medicao_pluviometrica pp
                  WHERE u.matricula = pp.matricula
                  UNION
                  SELECT u.matricula
                  FROM medicao_cota_diara cc
                  WHERE u.matricula = cc.matricula)

SELECT nome
FROM usuario
WHERE EXCEPT (SELECT u.nome
                FROM usuario u, medicao_cota_diaria mc, medicao_pluviometrica mp
                WHERE u.matricula = mc.matricula OR u.matricula = mp.matricula)
                
                
#15 - finalizado
SELECT a.nome
FROM acude a
WHERE a.comprimento = (SELECT MIN(a.comprimento)
                        FROM acude a)