REM   Projeto Logico usando o Modelo Relacional do Oracle - Script SQL-DDL
REM   Grupo: Gabriel Souto Maracaja, Gilvan Neto, Lucas Fernandes de Oliveira, Pedro Henrique Costa, Raquel Rufino e Victor Emanuel Farias

#02 - finalizado

SELECT nome, municipio
FROM posto_pluviometrico
GROUP BY municipio

#04 - incompleto

SELECT nome
FROM estacaoDeQualidade
WHERE (SELECT estado
        FROM (SELECT Posto
                FROM (SELECT Bacia
                        FROM (SELECT Rio
                                FROM estacaoDeQualidade)
                ) = "Paraiba" or SELECT () = "Ceará"
            

                
#07 - finalizado

SELECT nome
FROM estacaoDeQualidade
GROUP BY id_estacao
ORDER BY nome ASC

#08 - incompleto

SELECT COUNT(medicao_pluviometrica)
FROM acude

#09 - finalizado

SELECT a.nome, r.nome
FROM acude a, rio r
WHERE r.idRio = a.idRio
GROUP BY r.nome

#11 - "finalizado" (verificar questao da data)

SELECT m.SUM(valor_chuve_dia)
FROM medicao_pluviometrica m, acude a
WHERE a.idAcude = m.idAcude AND a.nome = "Coremas" AND m.data BETWEEN "02/07/2017" AND "02/08/2017" 

#12 - incompleto

SELECT u.nome
FROM usuario u, medicao_cota_diaria m
WHERE SELECT(MAX

#13 - finalizado

SELECT e.pH_acude
FROM estacaoDeQualidade e, acude a
WHERE e.idAcude = a.idAcude AND a.nome = "Bodocongo"
ORDEE BY e.pH_acude ASC

#14 - "finalizado"
SELECT nome
FROM usuario
WHERE EXCEPT (SELECT u.nome
                FROM usuario u, medicao_cota_diaria mc, medicao_pluviometrica mp
                WHERE u.matricula = mc.matricula OR u.matricula = mp.matricula)
