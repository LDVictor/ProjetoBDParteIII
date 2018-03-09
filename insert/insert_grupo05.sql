-- Triggers

-- 03. Faça um trigger que não permita a inserção de uma medição de cota diária de um açude para uma data posterior a data atual.

CREATE TRIGGER VerificaDataMedicao
    BEFORE INSERT ON medicao_cota_diaria
    FOR EACH ROW
        BEGIN
            IF (:new.data_medicao > SYSDATE) 
                THEN RAISE_APPLICATION_ERROR(-20000, 'Data da medição não pode ser maior que a data atual!');
            END IF;
        END;
.
RUN;

-- 10. Faça um trigger que, ao tentar inserir um valor de chuva negativo, o valor inserido seja 0.

CREATE TRIGGER ValorChuvaNegativo
    BEFORE INSERT ON medicao_pluviometrica
    FOR EACH ROW
        BEGIN
            IF (:new.valor_chuva_dia < 0)
                THEN :new.valor_chuva_dia := 0;
            END IF;
        END;
.
RUN;

-- Inserts

-- Bacia
INSERT INTO bacia VALUES (1, 'Amazonas', 320, 600);
INSERT INTO bacia VALUES (2, 'Ximbu', 4000, 230);
INSERT INTO bacia VALUES (3, 'Guarani', 6220, 100);
INSERT INTO bacia VALUES (4, 'Catarata PB', 32360, 80000);
INSERT INTO bacia VALUES (5, 'Curimatau', 3313, 150);
INSERT INTO bacia VALUES (6, 'Mamanguape', 3520, 190);

-- Posto Pluviométrico
INSERT INTO posto_pluviometrico VALUES (1, 'P. Rio Amazonas', 'Rua do Mato', 140, 'Bosque', 'Manaus', 'AM', 1);
INSERT INTO posto_pluviometrico VALUES (2, 'Posto Guarani', 'Rua Don Juan Sexto', 10, 'Brusque', 'Curitiba', 'PR', 3);
INSERT INTO posto_pluviometrico VALUES (3, 'ISCR Pluviometric', 'Rua dos Patos', 200, 'Centro', 'Cajazeiras', 'PB', 4);
INSERT INTO posto_pluviometrico VALUES (4, 'MRV', 'Rua da Castanha', 400, 'Belem', 'Fortaleza', 'CE', 2);
INSERT INTO posto_pluviometrico VALUES (5, 'Posto Paraiba', 'Rua Pedro Cabral', 1523, 'Centro', 'Campina Grande', 'PB', 5);
INSERT INTO posto_pluviometrico VALUES (6, 'Posto Mamanguape', 'Rua Manoel Gentil', 280, 'Centro', 'Mamanguape', 'PB', 6);
INSERT INTO posto_pluviometrico VALUES (7, 'P. P. Xingu', 'Rua da Liberdade', 367, 'Centro', 'Sao Felix', 'PA', 2);

-- Usuário
INSERT INTO usuario VALUES (115110681, 'Victor Emanuel');
INSERT INTO usuario VALUES (115114150, 'Raquel Rufino');
INSERT INTO usuario VALUES (112041940, 'Pedro Henrique');
INSERT INTO usuario VALUES (200134657, 'Brunna Amorim');
INSERT INTO usuario VALUES (115110977, 'Gabriel Maracajá');
INSERT INTO usuario VALUES (114211198, 'Gilvan Neto');

-- Medição Pluviométrica
INSERT INTO medicao_pluviometrica VALUES (1, '03-30-2016', 240, 1, 115110681);
INSERT INTO medicao_pluviometrica VALUES (2, '04-28-2014', 2000, 3, 200134657);
INSERT INTO medicao_pluviometrica VALUES (3, '03-30-2016', 3500, 2, 200134657);
INSERT INTO medicao_pluviometrica VALUES (4, '04-05-2015', 4350, 4, 114211198);
INSERT INTO medicao_pluviometrica VALUES (5, '08-07-2016', 5800, 5, 112041940);
INSERT INTO medicao_pluviometrica VALUES (6, '09-07-2016', 1440, 6, 112041940);
INSERT INTO medicao_pluviometrica VALUES (7, '03-05-2018', 6000, 2, 200134657);
INSERT INTO medicao_pluviometrica VALUES (8, '03-03-2018', 2400, 2, 200134657);
INSERT INTO medicao_pluviometrica VALUES (9, '03-01-2018', 7850, 3, 114211198);
-- Deve setar chuva para 0, ativando o trigger ValorChuvaNegativo, já que valor de chuva é menor que zero.
INSERT INTO medicao_pluviometrica VALUES (10, '04-02-2014', -440, 3, 112041940);
INSERT INTO medicao_pluviometrica VALUES (11, '10-05-2016', -800, 4, 115110681);

-- Telefone Usuário
INSERT INTO telefone_usuario VALUES (115110681, '83999215200');
INSERT INTO telefone_usuario VALUES (115110681, '83986845542');
INSERT INTO telefone_usuario VALUES (115114150, '83998691283');
INSERT INTO telefone_usuario VALUES (112041940, '83998269259');
INSERT INTO telefone_usuario VALUES (200134657, '83994587621');
INSERT INTO telefone_usuario VALUES (200134657, '11987562145');
INSERT INTO telefone_usuario VALUES (115110977, '83986477881');
INSERT INTO telefone_usuario VALUES (114211198, '83999266236');

-- Rio
INSERT INTO rio VALUES (1, 'Rio Amazonas', 'C', 1);
INSERT INTO rio VALUES (2, 'Rio Negro', 'Q', 1);
INSERT INTO rio VALUES (3, 'Rio das Piranhas', 'U', 1);
INSERT INTO rio VALUES (4, 'Rio Paraíba', 'S', 4);
INSERT INTO rio VALUES (5, 'Rio Ximbú', 'A', 2);
INSERT INTO rio VALUES (6, 'Rio Cearense', 'W', 2);
INSERT INTO rio VALUES (7, 'Rio Mamanguape', 'F', 6);
INSERT INTO rio VALUES (8, 'Rio Curimataú', 'H', 5);

-- Açude
INSERT INTO acude VALUES (1, 'Açude Velho', 3000, 2000, 4000, 4);
INSERT INTO acude VALUES (2, 'Açude Novo', 6600, 1000, 2500, 4);
INSERT INTO acude VALUES (3, 'Piranhas', 6000, 7000, 12000, 1);
INSERT INTO acude VALUES (4, 'Açude do Acre', 1000, 500, 2000, 1);
INSERT INTO acude VALUES (5, 'Ogro', 2000, 200, 400, 3);
INSERT INTO acude VALUES (6, 'Coremas', 7000, 6200, 300, 2);
INSERT INTO acude VALUES (7, 'Bodocongó', 200, 400, 500, 4);
INSERT INTO acude VALUES (8, 'Açude da Divisa', 2500, 220, 450, 7);
INSERT INTO acude VALUES (9, 'Tabuleiro', 4322, 370, 750, 5);
INSERT INTO acude VALUES (10, 'Açude Cristal', 500, 80, 250, 6);    

-- Medição Cota Diária
INSERT INTO medicao_cota_diaria VALUES (1, 200, '03-04-2017', 115110681, 1);
INSERT INTO medicao_cota_diaria VALUES (2, 300, '02-04-2017', 115114150, 4);
INSERT INTO medicao_cota_diaria VALUES (3, 5000, '01-28-2017', 200134657, 3);
INSERT INTO medicao_cota_diaria VALUES (4, 500, '02-02-2018', 200134657, 6);
INSERT INTO medicao_cota_diaria VALUES (5, 2000, '03-01-2018', 200134657, 2);
INSERT INTO medicao_cota_diaria VALUES (6, 100, '04-25-2017', 112041940, 5);
INSERT INTO medicao_cota_diaria VALUES (7, 3100, '02-23-2017', 114211198, 8);
INSERT INTO medicao_cota_diaria VALUES (8, 1245, '03-02-2018', 114211198, 6);
INSERT INTO medicao_cota_diaria VALUES (9, 3500, '12-18-2017', 200134657, 6);
INSERT INTO medicao_cota_diaria VALUES (10, 4000, '01-23-2018', 200134657, 6);
INSERT INTO medicao_cota_diaria VALUES (11, 3200, '01-02-2017', 115110681, 2);
-- Devem disparar o trigger VerificaDataMedicao, pois as datas são maiores que a data atual. Consequentemente, deve falhar e lançar a exceção.
INSERT INTO medicao_cota_diaria VALUES (12, 645, '08-26-2018', 114211198, 4);
INSERT INTO medicao_cota_diaria VALUES (13, 445, '10-30-2018', 115110681, 3);

-- Cota Área Volume
INSERT INTO cota_area_volume VALUES (1, 300, 400, 800, 2);
INSERT INTO cota_area_volume VALUES (2, 30, 300, 500, 1);
INSERT INTO cota_area_volume VALUES (3, 50, 50, 600, 3);
INSERT INTO cota_area_volume VALUES (4, 70, 100, 900, 5);
INSERT INTO cota_area_volume VALUES (5, 80, 200, 700, 4);
INSERT INTO cota_area_volume VALUES (6, 85, 100, 300, 8);
INSERT INTO cota_area_volume VALUES (7, 75, 80, 430, 7);
INSERT INTO cota_area_volume VALUES (8, 25, 50, 650, 6);  

-- Contribui
INSERT INTO contribui VALUES (1, 1);
INSERT INTO contribui VALUES (2, 2);
INSERT INTO contribui VALUES (1, 3);
INSERT INTO contribui VALUES (5, 3);
INSERT INTO contribui VALUES (4, 2);
INSERT INTO contribui VALUES (8, 4);
INSERT INTO contribui VALUES (6, 5);
INSERT INTO contribui VALUES (7, 6); 

-- Estação de Qualidade
INSERT INTO estacaoDeQualidade VALUES (1, 'Estação Nova', 30, 600, '06-12-2017', 6, 18, 4, 6, 55, '06-16-2017', 7, 55, 34, 12, 3, 1, 3);
INSERT INTO estacaoDeQualidade VALUES (2, 'Estação do Amazonas', 60, 500, '02-11-2017', 6, 17, 45, 6, 53, '05-13-2017', 1, 15, 24, 14, 35, 4, 2);
INSERT INTO estacaoDeQualidade VALUES (3, 'Estação Paraiba I', 60, 500, '08-05-2017', 6, 17, 45, 6, 53, '03-13-2018', 10, 65, 54, 34, 25, 4, 2);
INSERT INTO estacaoDeQualidade VALUES (4, 'Estação Paraiba II', 60, 500, '07-11-2017', 5, 37, 25, 46, 33, '05-13-2017', 1, 15, 24, 14, 35, 4, 2);
INSERT INTO estacaoDeQualidade VALUES (5, 'Estação Paraiba III', 680, 500, '07-15-2017', 25, 11, 25, 56, 33, '05-13-2017', 7, 25, 44, 4, 365, 4, 2);
INSERT INTO estacaoDeQualidade VALUES (6, 'Estação Fortaleza', 620, 520, '07-16-2017', 25, 11, 25, 56, 33, '04-13-2017', 7, 25, 44, 4, 365, 2, 5);
INSERT INTO estacaoDeQualidade VALUES (7, 'MRV Bodocongó', 620, 520, '07-06-2017', 25, 11, 25, 56, 33, '04-12-2017', 7, 25, 44, 4, 365, 4, 7);
INSERT INTO estacaoDeQualidade VALUES (8, 'Estação Bodocongó I', 620, 520, '03-06-2018', 25, 11, 25, 56, 33, '07-12-2017', 5, 25, 44, 4, 365, 4, 7);
INSERT INTO estacaoDeQualidade VALUES (9, 'Estação Bodocongó II', 620, 520, '03-09-2018', 25, 11, 25, 56, 33, '03-12-2018', 10, 25, 44, 4, 365, 4, 7);
INSERT INTO estacaoDeQualidade VALUES (10, 'Estação Principal', 20, 550, '06-09-2017', 5, 16, 3, 9, 50, '06-13-2017', 4, 52, 24, 17, 31, 7, 7);
INSERT INTO estacaoDeQualidade VALUES (11, 'Estação das Arvores', 40, 590, '02-05-2017', 6, 17, 45, 6, 53, '04-08-2017', 12, 5, 29, 12, 31, 8, 6);    



