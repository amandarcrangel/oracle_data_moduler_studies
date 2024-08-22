-- Gerado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   em:        2024-08-20 11:57:38 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE t_sip_dependente CASCADE CONSTRAINTS;

DROP TABLE t_sip_funcionario CASCADE CONSTRAINTS;

DROP TABLE t_sip_implatacao CASCADE CONSTRAINTS;

DROP TABLE t_sip_projeto CASCADE CONSTRAINTS;

DROP TABLE t_sp_departamento CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_sip_dependente (
    cd_dependente                  NUMBER(5) NOT NULL,
    t_sip_funcionario_nr_matricula NUMBER(5) NOT NULL,
    rm_dependente                  VARCHAR2(50) NOT NULL,
    dt_nascimento                  DATE NOT NULL
);

ALTER TABLE t_sip_dependente ADD CONSTRAINT pk_t_sip_dependente PRIMARY KEY ( cd_dependente,
                                                                              t_sip_funcionario_nr_matricula );

CREATE TABLE t_sip_funcionario (
    nr_matricula      NUMBER(5) NOT NULL,
    cd_depto          NUMBER(3) NOT NULL,
    rm_funcionario    VARCHAR2(50) NOT NULL,
    dt_nascimento     DATE NOT NULL,
    dt_adimissao      DATE NOT NULL,
    ds_endereco       VARCHAR2(100) NOT NULL,
    vl_salario_mensal NUMBER(7, 2) NOT NULL
);

ALTER TABLE t_sip_funcionario ADD CONSTRAINT ck_sip_func_salario CHECK ( vl_salario_mensal >= 1212 );

ALTER TABLE t_sip_funcionario ADD CONSTRAINT pk_t_sip_funcionario PRIMARY KEY ( nr_matricula );

CREATE TABLE t_sip_implatacao (
    t_sip_projeto_cd_projeto       NUMBER(5) NOT NULL,
    cd_implantacao                 NUMBER(5) NOT NULL,
    t_sip_funcionario_nr_matricula NUMBER(5) NOT NULL,
    dt_entrada                     DATE NOT NULL,
    dt_saida                       DATE NOT NULL
);

ALTER TABLE t_sip_implatacao ADD CONSTRAINT ck_sip_implatacao_data CHECK ( dt_saida > dt_entrada );

ALTER TABLE t_sip_implatacao ADD CONSTRAINT pk_t_sip_implatacao PRIMARY KEY ( cd_implantacao,
                                                                              t_sip_projeto_cd_projeto );

CREATE TABLE t_sip_projeto (
    cd_projeto NUMBER(5) NOT NULL,
    rm_projeto VARCHAR2(50) NOT NULL,
    dt_inicio  DATE NOT NULL,
    dt_termino DATE NOT NULL
);

ALTER TABLE t_sip_projeto ADD CONSTRAINT ck_sip_projeto_data CHECK ( dt_termino > dt_inicio );

ALTER TABLE t_sip_projeto ADD CONSTRAINT pk_t_sip_projeto PRIMARY KEY ( cd_projeto );

CREATE TABLE t_sp_departamento (
    cd_depto NUMBER(3) NOT NULL,
    nm_depto VARCHAR2(30) NOT NULL,
    sg_depto CHAR(3) NOT NULL
);

COMMENT ON COLUMN t_sp_departamento.cd_depto IS
    'Indentificador unico da entidade departamento ';

ALTER TABLE t_sp_departamento ADD CONSTRAINT pk_t_sip_departamento PRIMARY KEY ( cd_depto );

ALTER TABLE t_sp_departamento ADD CONSTRAINT un_sip_depto_nome UNIQUE ( nm_depto );

ALTER TABLE t_sp_departamento ADD CONSTRAINT un_sip_depto_sigla UNIQUE ( sg_depto );

ALTER TABLE t_sip_dependente
    ADD CONSTRAINT fk_sip_dependente_func FOREIGN KEY ( t_sip_funcionario_nr_matricula )
        REFERENCES t_sip_funcionario ( nr_matricula );

ALTER TABLE t_sip_funcionario
    ADD CONSTRAINT fk_sip_func_depto FOREIGN KEY ( cd_depto )
        REFERENCES t_sp_departamento ( cd_depto );

ALTER TABLE t_sip_implatacao
    ADD CONSTRAINT fk_sip_implat_func FOREIGN KEY ( t_sip_funcionario_nr_matricula )
        REFERENCES t_sip_funcionario ( nr_matricula );

ALTER TABLE t_sip_implatacao
    ADD CONSTRAINT fk_sip_implat_projeto FOREIGN KEY ( t_sip_projeto_cd_projeto )
        REFERENCES t_sip_projeto ( cd_projeto );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler:
--
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                             14
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
--
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
--
-- REDACTION POLICY                         0
--
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
--
-- ERRORS                                   0
-- WARNINGS                                 0
