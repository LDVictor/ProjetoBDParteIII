-- Clean

DELETE FROM medicao_pluviometrica;

DELETE FROM telefone_usuario;

DELETE FROM medicao_cota_diaria;

DELETE FROM cota_area_volume;

DELETE FROM contribui;

DELETE FROM estacaoDeQualidade;

DELETE FROM posto_pluviometrico;

DELETE FROM usuario;

DELETE FROM acude;

DELETE FROM rio;

DELETE FROM bacia;

DELETE FROM InfoAcude;

DELETE FROM InfoChuvas;

DROP TRIGGER VerificaDataMedicao;

DROP TRIGGER ValorChuvaNegativo;
