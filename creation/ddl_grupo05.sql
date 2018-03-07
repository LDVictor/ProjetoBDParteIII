REM   Projeto Logico usando o Modelo Relacional do Oracle - Script SQL-DDL
REM   Grupo: Gabriel Souto Maracaja, Gilvan Neto, Lucas Fernandes de Oliveira, Pedro Henrique Costa, Raquel Rufino e Victor Emanuel Farias

-- Bacia
CREATE TABLE bacia (         
    id_bacia NUMBER,         
    nome VARCHAR(15) NOT NULL,         
    area NUMBER(9,2),         
    perimetro NUMBER(9,2),         
    PRIMARY KEY(id_bacia) 
);

-- Posto Pluviometrico
CREATE TABLE posto_pluviometrico (      
    id_posto_pluviometrico NUMBER,      
    nome VARCHAR(30) NOT NULL,      
    rua VARCHAR(30) NOT NULL,      
    numero INT NOT NULL,      
    bairro VARCHAR(15) NOT NULL,      
    municipio VARCHAR(15) NOT NULL,      
    estado CHAR(2),      
    id_bacia NUMBER,      
    PRIMARY KEY(id_posto_pluviometrico),    
    FOREIGN KEY (id_bacia) REFERENCES bacia(id_bacia)      
);

-- Usuario
CREATE TABLE usuario (     
    matricula NUMBER,     
    nome VARCHAR(50) NOT NULL,     
    PRIMARY KEY(matricula)     
);

-- Medicao Pluviometrica
CREATE TABLE medicao_pluviometrica (       
    id_medicao NUMBER,       
    data_medicao DATE NOT NULL,       
    valor_chuva_dia NUMBER(9,2),            
    id_posto_pluviometrico NUMBER,       
    matricula NUMBER,       
    PRIMARY KEY (id_medicao, matricula),      
    FOREIGN KEY (id_posto_pluviometrico) REFERENCES posto_pluviometrico(id_posto_pluviometrico),       
    FOREIGN KEY (matricula) REFERENCES usuario(matricula)       
);

-- Telefone Usuario
CREATE TABLE telefone_usuario (      
    matricula NUMBER,      
    numero CHAR(11),      
    PRIMARY KEY(matricula, numero),    
    FOREIGN KEY (matricula) REFERENCES usuario(matricula)      
);

-- Rio
CREATE TABLE rio(    
    id_rio NUMBER,    
    nome VARCHAR(30),    
    indicativo CHAR,     
    id_bacia NUMBER,    
    PRIMARY KEY(id_rio),    
    FOREIGN KEY (id_bacia) REFERENCES bacia(id_bacia)    
    );

-- Acude
CREATE TABLE acude(       
    id_acude NUMBER,       
    nome VARCHAR(30),       
    volume_maximo NUMBER(9,2),       
    comprimento NUMBER(9,2),       
    area NUMBER(9,2),       
    id_rio NUMBER,     
    PRIMARY KEY (id_acude),     
    FOREIGN KEY (id_rio) REFERENCES rio(id_rio)     
);

-- Medicao Cota Diaria
CREATE TABLE medicao_cota_diaria(           
    id_medicao_diaria NUMBER,           
    cota_atual NUMBER,           
    data_medicao DATE,           
    matricula NUMBER,           
    id_acude NUMBER,           
    PRIMARY KEY(id_medicao_diaria, id_acude),         
    FOREIGN KEY (matricula) REFERENCES usuario(matricula),           
    FOREIGN KEY (id_acude) REFERENCES acude(id_acude)           
);

-- Cota Area Volume
CREATE TABLE cota_area_volume (       
    id_area_volume NUMBER,       
    cota NUMBER(9,2),       
    area NUMBER(9,2),        
    volume NUMBER(9,2),       
    id_acude NUMBER,       
    PRIMARY KEY(id_area_volume),     
    FOREIGN KEY(id_acude) REFERENCES acude(id_acude)       
);

-- Contribui
CREATE TABLE contribui(       
    id_acude NUMBER,       
    id_posto_pluviometrico NUMBER,       
    PRIMARY KEY(id_acude, id_posto_pluviometrico),     
    FOREIGN KEY (id_acude) REFERENCES acude(id_acude),       
    FOREIGN KEY (id_posto_pluviometrico) REFERENCES posto_pluviometrico(id_posto_pluviometrico)       
);

-- Estacao de Qualidade
CREATE TABLE estacaoDeQualidade(     
    id_estacao_qualidade NUMBER,     
    nome VARCHAR(30),     
    latitude NUMBER(9,2),     
    longitude NUMBER(9,2),     
    data_medicao_rio DATE NOT NULL,     
    pH_rio NUMBER(9,2),     
    DBO_rio NUMBER(9,2),     
    turbidez_rio NUMBER(9,2),     
    oxigenio_rio NUMBER(9,2),     
    alcalinidade_rio NUMBER(9,2),     
    data_medicao_acude DATE NOT NULL,     
    pH_acude NUMBER(9,2),     
    DBO_acude NUMBER(9,2),     
    turbidez_acude NUMBER(9,2),     
    oxigenio_acude NUMBER(9,2),     
    alcalinidade_acude NUMBER(9,2),     
    id_rio NUMBER,     
    id_acude NUMBER,     
    PRIMARY KEY (id_estacao_qualidade),     
    FOREIGN KEY (id_rio) REFERENCES rio(id_rio),     
    FOREIGN KEY (id_acude) REFERENCES acude(id_acude)     
);

