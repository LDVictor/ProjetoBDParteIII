INSERT INTO bacia VALUES (1, "Bacia do Rio Amazonas", 320, 600);
INSERT INTO bacia VALUES (2, "Bacia hidrográfica Ximbu", 4000, 230);
INSERT INTO bacia VALUES (3, "Aquífero Guarani", 6220, 100);
INSERT INTO bacia VALUES (4, "Catarata Paraíba", 32360, 80000);

INSERT INTO posto_pluviometrico VALUES (1, "Posto do Rio Amazonas", "Rua do Mato", 140, "Bosque", "Manaus", "AM", 1);
INSERT INTO posto_pluviometrico VALUES (2, "Posto Guarani", "Rua Don Juan Sexto", 10, "Brusque", "Curitiba", "PR", 3);
INSERT INTO posto_pluviometrico VALUES (3, "ISCR Mobile Pluviometric", "Rua dos Patos", 200, "Centro", "Cajazeiras", "PB", 4);

INSERT INTO usuario VALUES (115110681, "Victor Emanuel");
INSERT INTO usuario VALUES (115114150, "Raquel Rufino");
INSERT INTO usuario VALUES (112041940, "Pedro Henrique");
INSERT INTO usuario VALUES (200134657, "Brunna Amorim");

INSERT INTO medicao_pluviometrica VALUES (1, "03-30-2016", 240, 1, 115110681);
INSERT INTO medicao_pluviometrica VALUES (2, "04-28-2014", 2000, 3, 200134657);
INSERT INTO medicao_pluviometrica VALUES (3, "03-30-2016", 3500, 2, 200134657);

INSERT INTO rio VALUES (1, "Rio Amazonas", "C", 1);
INSERT INTO rio VALUES (2, "Rio Negro", "Q", 1);
INSERT INTO rio VALUES (3, "Rio das Piranhas", "U", 1);
INSERT INTO rio VALUES (4, "Rio Paraíba", "S", 4);
INSERT INTO rio VALUES (5, "Rio Ximbu", "A", 2);

INSERT INTO acude VALUES (1, "Açude Velho", 3000, 2000, 4000, 4);
INSERT INTO acude VALUES (2, "Açude Novo", 6600, 1000, 2500, 4);
INSERT INTO acude VALUES (3, "Açude das Piranhas", 6000, 7000, 12000, 1);
INSERT INTO acude VALUES (4, "Açude do Acre", 1000, 500, 2000, 1);
INSERT INTO acude VALUES (5, "Açude do Ogro", 2000, 200, 400, 3);

INSERT INTO medicao_cota_diaria VALUES (1, 200, "03-04-2017", 115110681, 1);
INSERT INTO medicao_cota_diaria VALUES (2, 300, "02-04-2017", 115114150, 4);
INSERT INTO medicao_cota_diaria VALUES (3, 5000, "01-28-2017", 200134657, 3);

INSERT INTO cota_area_volume VALUES (1, 300, 400, 800, 2);
INSERT INTO cota_area_volume VALUES (2, 30, 300, 500, 1);
INSERT INTO cota_area_volume VALUES (3, 50, 50, 600, 3);
INSERT INTO cota_area_volume VALUES (4, 70, 100, 900, 5);
INSERT INTO cota_area_volume VALUES (5, 80, 200, 700, 4);

INSERT INTO contribui VALUES (1, 1);
INSERT INTO contribui VALUES (2, 2);
INSERT INTO contribui VALUES (1, 3);
INSERT INTO contribui VALUES (5, 3);
INSERT INTO contribui VALUES (4, 2);

INSERT INTO estacaoDeQualidade VALUES (1, "Estação Nova", 30, 600, "06-12-2017", 6, 18, 4, 6, 55, "06-16-2017", 7, 55, 34, 12, 3, 1, 3);
INSERT INTO estacaoDeQualidade VALUES (2, "Estação do Amazonas", 60, 500, "02-11-2017", 6, 17, 45, 6, 53, "05-13-2017", 1, 15, 24, 14, 35, 4, 2);