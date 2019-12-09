/*
Creator: Douglas De Rizzo Meneghetti
Date: 18-7-2014

What this script does:

- imports the data into a relational database, allowing for better that querying;
- normalizes the data, avoiding redundancies.

Instructions:

1. download the data, available [here](http://portal.inep.gov.br/basica-levantamentos-acessar) and unzip it;
2. In a MariaDB or MySQL database, run this file.
*/

set SQL_SAFE_UPDATES = 0;
drop schema if exists enem_2012;
create schema enem_2012;
use enem_2012;

create table debug(STATUS varchar(150), tempo time);

insert into debug values('Ccreating temporary tables', curtime());

create table tmp_dados (
    NU_INSCRICAO varchar(12) primary key,
    NU_ANO year,
    NU_IDADE tinyint unsigned,
    TP_SEXO boolean,
    COD_MUNICIPIO_INSC char(7),
    NO_MUNICIPIO_INSC varchar(150),
    UF_INSC char(2),
    ST_CONCLUSAO tinyint,
    ANO_CONCLUIU year,
    TP_ESCOLA tinyint,
    IN_TP_ENSINO tinyint,
    TP_ESTADO_CIVIL tinyint,
    TP_COR_RACA tinyint,
    IN_UNIDADE_HOSPITALAR boolean,
    IN_BAIXA_VISAO boolean,
    IN_CEGUEIRA boolean,
    IN_SURDEZ boolean,
    IN_DEFICIENCIA_AUDITIVA boolean,
    IN_SURDO_CEGUEIRA boolean,
    IN_DEFICIENCIA_FISICA boolean,
    IN_DEFICIENCIA_MENTAL boolean,
    IN_DEFICIT_ATENCAO boolean,
    IN_DISLEXIA boolean,
    IN_GESTANTE boolean,
    IN_LACTANTE boolean,
    IN_IDOSO boolean,
    IN_AUTISMO boolean,
    IN_SABATISTA boolean,
    IN_BRAILLE boolean,
    IN_AMPLIADA boolean,
    IN_LEDOR boolean,
    IN_ACESSO boolean,
    IN_TRANSCRICAO boolean,
    IN_LIBRAS boolean,
    IN_LEITURA_LABIAL boolean,
    IN_MESA_CADEIRA_RODAS boolean,
    IN_MESA_CADEIRA_SEPARADA boolean,
    IN_APOIO_PERNA boolean,
    IN_GUIA_INTERPRETE boolean,
    IN_CERTIFICADO boolean,
    NO_ENTIDADE_CERTIFICACAO varchar(150),
    UF_ENTIDADE_CERTIFICACAO char(2),
    PK_COD_ENTIDADE int,
    COD_MUNICIPIO_ESC int,
    NO_MUNICIPIO_ESC varchar(150),
    UF_ESC char(2),
    ID_DEPENDENCIA_ADM tinyint,
    ID_LOCALIZACAO tinyint,
    SIT_FUNC tinyint,
    COD_MUNICIPIO_PROVA int,
    NO_MUNICIPIO_PROVA varchar(150),
    UF_MUNICIPIO_PROVA char(2),
    IN_PRESENCA_CN tinyint,
    IN_PRESENCA_CH tinyint,
    IN_PRESENCA_LC tinyint,
    IN_PRESENCA_MT tinyint,
    NU_NT_CN int,
    NU_NT_CH int,
    NU_NT_LC int,
    NU_NT_MT int,
    TX_RESPOSTAS_CN char(45),
    TX_RESPOSTAS_CH char(45),
    TX_RESPOSTAS_LC char(45),
    TX_RESPOSTAS_MT char(45),
    ID_PROVA_CN tinyint unsigned,
    ID_PROVA_CH tinyint unsigned,
    ID_PROVA_LC tinyint unsigned,
    ID_PROVA_MT tinyint unsigned,
    TP_LINGUA boolean,
    DS_GABARITO_CN char(45),
    DS_GABARITO_CH char(45),
    DS_GABARITO_LC char(50),
    DS_GABARITO_MT char(45),
    IN_STATUS_REDACAO char(1),
    NU_NOTA_COMP1 int unsigned,
    NU_NOTA_COMP2 int unsigned,
    NU_NOTA_COMP3 int unsigned,
    NU_NOTA_COMP4 int unsigned,
    NU_NOTA_COMP5 int unsigned,
    NU_NOTA_REDACAO int unsigned
);

create table tmp_socioeconomico (
    NU_INSCRICAO varchar(12) primary key,
    IN_QSE char(1),
    Q01 char(1),
    Q02 char(1),
    Q03 char(1),
    Q04 char(2),
    Q05 char(1),
    Q06 char(1),
    Q07 char(1),
    Q08 char(1),
    Q09 char(1),
    Q10 char(1),
    Q11 char(1),
    Q12 char(1),
    Q13 char(1),
    Q14 char(1),
    Q15 char(1),
    Q16 char(1),
    Q17 char(1),
    Q18 char(1),
    Q19 char(1),
    Q20 char(1),
    Q21 char(1),
    Q22 char(1),
    Q23 char(1),
    Q24 char(1),
    Q25 char(1),
    Q26 char(1),
    Q27 char(1),
    Q28 char(1),
    Q29 char(1),
    Q30 char(1),
    Q31 char(1),
    Q32 char(1),
    Q33 char(1),
    Q34 char(1),
    Q35 char(1),
    Q36 char(1),
    Q37 char(1),
    Q38 char(1),
    Q39 char(1),
    Q40 char(1),
    Q41 char(1),
    Q42 char(1),
    Q43 char(1),
    Q44 char(1),
    Q45 char(1),
    Q46 char(1),
    Q47 char(1),
    Q48 char(1),
    Q49 char(1),
    Q50 char(1),
    Q51 char(1),
    Q52 char(1),
    Q53 char(1),
    Q54 char(1),
    Q55 char(1),
    Q56 char(1),
    Q57 char(1),
    Q58 char(1),
    Q59 char(1),
    Q60 char(1),
    Q61 char(1),
    Q62 char(1),
constraint foreign key(NU_INSCRICAO) references tmp_dados(NU_INSCRICAO) on delete cascade
);

create table tmp_itens
(
ID_POSICAO varchar(3),
COD_AREA varchar(2),
ID_ITEM mediumint unsigned,
DS_GABARITO char(1),
ID_HABILIDADE tinyint unsigned,
DS_COR varchar(7),
ID_PROVA varchar(3)
);

create table itens (
    ID mediumint primary key,
    ID_PROVA varchar(3),
    ID_POSICAO varchar(3),
    GABARITO char(1),
    ID_HABILIDADE tinyint,
    A DOUBLE DEFAULT NULL,
    B DOUBLE DEFAULT NULL,
    C DOUBLE DEFAULT NULL,
    D DOUBLE DEFAULT NULL
);

create table provas (
    ID varchar(3) primary key,
    GABARITO varchar(45)
);

create table municipios(
	ID varchar(7) primary key,
	NOME varchar(150)
);

create table alunos (
    ID int unsigned auto_increment primary key,
    INSCRICAO varchar(15),
    ANO year,
    IDADE tinyint unsigned,
    TP_SEXO boolean,
    ID_MUNICIPIO_INSC char(7),
    UF_INSC char(2),
    ST_CONCLUSAO tinyint,
    ANO_CONCLUIU year,
    TP_ESCOLA tinyint,
    IN_TP_ENSINO tinyint,
    TP_ESTADO_CIVIL tinyint,
    TP_COR_RACA tinyint,
    IN_UNIDADE_HOSPITALAR boolean,
    IN_BAIXA_VISAO boolean,
    IN_CEGUEIRA boolean,
    IN_SURDEZ boolean,
    IN_DEFICIENCIA_AUDITIVA boolean,
    IN_SURDO_CEGUEIRA boolean,
    IN_DEFICIENCIA_FISICA boolean,
    IN_DEFICIENCIA_MENTAL boolean,
    IN_DEFICIT_ATENCAO boolean,
    IN_DISLEXIA boolean,
    IN_GESTANTE boolean,
    IN_LACTANTE boolean,
    IN_IDOSO boolean,
    IN_AUTISMO boolean,
    IN_SABATISTA boolean,
    IN_BRAILLE boolean,
    IN_AMPLIADA boolean,
    IN_LEDOR boolean,
    IN_ACESSO boolean,
    IN_TRANSCRICAO boolean,
    IN_LIBRAS boolean,
    IN_LEITURA_LABIAL boolean,
    IN_MESA_CADEIRA_RODAS boolean,
    IN_MESA_CADEIRA_SEPARADA boolean,
    IN_APOIO_PERNA boolean,
    IN_GUIA_INTERPRETE boolean,
    IN_CERTIFICADO boolean,
    NO_ENTIDADE_CERTIFICACAO varchar(150),
    UF_ENTIDADE_CERTIFICACAO char(2),
    PK_COD_ENTIDADE int,
    ID_MUNICIPIO_ESC char(7),
    UF_ESC char(2),
    ID_DEPENDENCIA_ADM tinyint,
    ID_LOCALIZACAO tinyint,
    SIT_FUNC tinyint,
    ID_MUNICIPIO_PROVA char(7),
    UF_MUNICIPIO_PROVA char(2),
    IN_PRESENCA_CN tinyint,
    IN_PRESENCA_CH tinyint,
    IN_PRESENCA_LC tinyint,
    IN_PRESENCA_MT tinyint,
    RESPOSTAS_CN char(45),
    RESPOSTAS_CH char(45),
    RESPOSTAS_LC char(45),
    RESPOSTAS_MT char(45),
    TP_LINGUA boolean,
	PROFICIENCIA_CH double,
    PROFICIENCIA_CN double,
    PROFICIENCIA_LC double,
    PROFICIENCIA_MT double,
    IN_STATUS_REDACAO char(1),
    NU_NOTA_COMP1 int unsigned,
    NU_NOTA_COMP2 int unsigned,
    NU_NOTA_COMP3 int unsigned,
    NU_NOTA_COMP4 int unsigned,
    NU_NOTA_COMP5 int unsigned,
    NU_NOTA_REDACAO int unsigned,
    Q01 char(1),
    Q02 char(1),
    Q03 char(1),
    Q04 char(2),
    Q05 char(1),
    Q06 char(1),
    Q07 char(1),
    Q08 char(1),
    Q09 char(1),
    Q10 char(1),
    Q11 char(1),
    Q12 char(1),
    Q13 char(1),
    Q14 char(1),
    Q15 char(1),
    Q16 char(1),
    Q17 char(1),
    Q18 char(1),
    Q19 char(1),
    Q20 char(1),
    Q21 char(1),
    Q22 char(1),
    Q23 char(1),
    Q24 char(1),
    Q25 char(1),
    Q26 char(1),
    Q27 char(1),
    Q28 char(1),
    Q29 char(1),
    Q30 char(1),
    Q31 char(1),
    Q32 char(1),
    Q33 char(1),
    Q34 char(1),
    Q35 char(1),
    Q36 char(1),
    Q37 char(1),
    Q38 char(1),
    Q39 char(1),
    Q40 char(1),
    Q41 char(1),
    Q42 char(1),
    Q43 char(1),
    Q44 char(1),
    Q45 char(1),
    Q46 char(1),
    Q47 char(1),
    Q48 char(1),
    Q49 char(1),
    Q50 char(1),
    Q51 char(1),
    Q52 char(1),
    Q53 char(1),
    Q54 char(1),
    Q55 char(1),
    Q56 char(1),
    Q57 char(1),
    Q58 char(1),
    Q59 char(1),
    Q60 char(1),
    Q61 char(1),
    Q62 char(1),
    constraint foreign key (ID_MUNICIPIO_INSC)
        references municipios (ID),
    constraint foreign key (ID_MUNICIPIO_ESC)
        references municipios (ID),
    constraint foreign key (ID_MUNICIPIO_PROVA)
        references municipios (ID)
);

insert into debug values('Populating tmp_itens table...', curtime());

load data local infile '/home/douglas/Desktop/microdados/enem/2012/originais/DADOS/ITENS_ENEM_2012.csv'
into table tmp_itens
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
LINES TERMINATED BY '\r\n'
ignore 1 lines;

insert into debug values('Populating tmp_dados table...', curtime());

load data local infile '/home/douglas/Desktop/microdados/enem/2012/originais/DADOS/DADOS_ENEM_2012.csv'
into table tmp_dados
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
LINES TERMINATED BY '\r\n'
ignore 1 lines;

insert into debug values('Populating tmp_socioeconomico table...', curtime());

load data local infile '/home/douglas/Desktop/microdados/enem/2012/originais/DADOS/QUESTIONARIO_ENEM_2012.csv'
into table tmp_socioeconomico
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
LINES TERMINATED BY '\r\n'
ignore 1 lines;

insert into debug values('Populating municipios table', curtime());

insert into municipios (ID, NOME)
select
    COD_MUNICIPIO_INSC as COD_MUNICIPIO,
    NO_MUNICIPIO_INSC as NO_MUNICIPIO
from
    tmp_dados a
union select
    COD_MUNICIPIO_ESC as COD_MUNICIPIO,
    NO_MUNICIPIO_ESC as NO_MUNICIPIO
from
    tmp_dados b
union select
    COD_MUNICIPIO_PROVA as COD_MUNICIPIO,
    NO_MUNICIPIO_PROVA as NO_MUNICIPIO
from
    tmp_dados c
order by COD_MUNICIPIO;

insert into debug values('Populating alunos table', curtime());

insert into alunos
(
    INSCRICAO,
    ANO,
    IDADE,
    TP_SEXO,
    ID_MUNICIPIO_INSC,
    UF_INSC,
    ST_CONCLUSAO,
    ANO_CONCLUIU,
    TP_ESCOLA,
    IN_TP_ENSINO,
    TP_ESTADO_CIVIL,
    TP_COR_RACA,
    IN_UNIDADE_HOSPITALAR,
    IN_BAIXA_VISAO,
    IN_CEGUEIRA,
    IN_SURDEZ,
    IN_DEFICIENCIA_AUDITIVA,
    IN_SURDO_CEGUEIRA,
    IN_DEFICIENCIA_FISICA,
    IN_DEFICIENCIA_MENTAL,
    IN_DEFICIT_ATENCAO,
    IN_DISLEXIA,
    IN_GESTANTE,
    IN_LACTANTE,
    IN_IDOSO,
    IN_AUTISMO,
    IN_SABATISTA,
    IN_BRAILLE,
    IN_AMPLIADA,
    IN_LEDOR,
    IN_ACESSO,
    IN_TRANSCRICAO,
    IN_LIBRAS,
    IN_LEITURA_LABIAL,
    IN_MESA_CADEIRA_RODAS,
    IN_MESA_CADEIRA_SEPARADA,
    IN_APOIO_PERNA,
    IN_GUIA_INTERPRETE,
    IN_CERTIFICADO,
    NO_ENTIDADE_CERTIFICACAO,
    UF_ENTIDADE_CERTIFICACAO,
    PK_COD_ENTIDADE,
    ID_MUNICIPIO_ESC,
    UF_ESC,
    ID_DEPENDENCIA_ADM,
    ID_LOCALIZACAO,
    SIT_FUNC,
    ID_MUNICIPIO_PROVA,
    UF_MUNICIPIO_PROVA,
    IN_PRESENCA_CN,
    IN_PRESENCA_CH,
    IN_PRESENCA_LC,
    IN_PRESENCA_MT,
    TP_LINGUA,
    IN_STATUS_REDACAO,
    NU_NOTA_COMP1,
    NU_NOTA_COMP2,
    NU_NOTA_COMP3,
    NU_NOTA_COMP4,
    NU_NOTA_COMP5,
    NU_NOTA_REDACAO,
    Q01,
    Q02,
    Q03,
    Q04,
    Q05,
    Q06,
    Q07,
    Q08,
    Q09,
    Q10,
    Q11,
    Q12,
    Q13,
    Q14,
    Q15,
    Q16,
    Q17,
    Q18,
    Q19,
    Q20,
    Q21,
    Q22,
    Q23,
    Q24,
    Q25,
    Q26,
    Q27,
    Q28,
    Q29,
    Q30,
    Q31,
    Q32,
    Q33,
    Q34,
    Q35,
    Q36,
    Q37,
    Q38,
    Q39,
    Q40,
    Q41,
    Q42,
    Q43,
    Q44,
    Q45,
    Q46,
    Q47,
    Q48,
    Q49,
    Q50,
    Q51,
    Q52,
    Q53,
    Q54,
    Q55,
    Q56,
    Q57,
    Q58,
    Q59,
    Q60,
    Q61,
    Q62
)
select
    a.NU_INSCRICAO,
    a.NU_ANO,
    a.NU_IDADE,
    a.TP_SEXO,
    a.COD_MUNICIPIO_INSC,
    a.UF_INSC,
    a.ST_CONCLUSAO,
    a.ANO_CONCLUIU,
    a.TP_ESCOLA,
    a.IN_TP_ENSINO,
    a.TP_ESTADO_CIVIL,
    a.TP_COR_RACA,
    a.IN_UNIDADE_HOSPITALAR,
    a.IN_BAIXA_VISAO,
    a.IN_CEGUEIRA,
    a.IN_SURDEZ,
    a.IN_DEFICIENCIA_AUDITIVA,
    a.IN_SURDO_CEGUEIRA,
    a.IN_DEFICIENCIA_FISICA,
    a.IN_DEFICIENCIA_MENTAL,
    a.IN_DEFICIT_ATENCAO,
    a.IN_DISLEXIA,
    a.IN_GESTANTE,
    a.IN_LACTANTE,
    a.IN_IDOSO,
    a.IN_AUTISMO,
    a.IN_SABATISTA,
    a.IN_BRAILLE,
    a.IN_AMPLIADA,
    a.IN_LEDOR,
    a.IN_ACESSO,
    a.IN_TRANSCRICAO,
    a.IN_LIBRAS,
    a.IN_LEITURA_LABIAL,
    a.IN_MESA_CADEIRA_RODAS,
    a.IN_MESA_CADEIRA_SEPARADA,
    a.IN_APOIO_PERNA,
    a.IN_GUIA_INTERPRETE,
    a.IN_CERTIFICADO,
    NO_ENTIDADE_CERTIFICACAO = case NO_ENTIDADE_CERTIFICACAO when length(trim(NO_ENTIDADE_CERTIFICACAO))=0 then NO_ENTIDADE_CERTIFICACAO else null end,
    UF_ENTIDADE_CERTIFICACAO = case UF_ENTIDADE_CERTIFICACAO when length(trim(UF_ENTIDADE_CERTIFICACAO))=0 then UF_ENTIDADE_CERTIFICACAO else null end,
    a.PK_COD_ENTIDADE,
    a.COD_MUNICIPIO_ESC,
    case UF_ESC when length(trim(UF_ESC))=0 then UF_ESC else null end,
    a.ID_DEPENDENCIA_ADM,
    a.ID_LOCALIZACAO,
    a.SIT_FUNC,
    a.COD_MUNICIPIO_PROVA,
    a.UF_MUNICIPIO_PROVA,
    a.IN_PRESENCA_CN,
    a.IN_PRESENCA_CH,
    a.IN_PRESENCA_LC,
    a.IN_PRESENCA_MT,
    a.TP_LINGUA,
    a.IN_STATUS_REDACAO,
    a.NU_NOTA_COMP1,
    a.NU_NOTA_COMP2,
    a.NU_NOTA_COMP3,
    a.NU_NOTA_COMP4,
    a.NU_NOTA_COMP5,
    a.NU_NOTA_REDACAO,
    case when length(trim(b.Q01)) = 0 then null else b.Q01 end,
    case when length(trim(b.Q02)) = 0 then null else b.Q02 end,
    case when length(trim(b.Q03)) = 0 then null else b.Q03 end,
    case when length(trim(b.Q04)) = 0 then null else b.Q04 end,
    case when length(trim(b.Q05)) = 0 then null else b.Q05 end,
    case when length(trim(b.Q06)) = 0 then null else b.Q06 end,
    case when length(trim(b.Q07)) = 0 then null else b.Q07 end,
    case when length(trim(b.Q08)) = 0 then null else b.Q08 end,
    case when length(trim(b.Q09)) = 0 then null else b.Q09 end,
    case when length(trim(b.Q10)) = 0 then null else b.Q10 end,
    case when length(trim(b.Q11)) = 0 then null else b.Q11 end,
    case when length(trim(b.Q12)) = 0 then null else b.Q12 end,
    case when length(trim(b.Q13)) = 0 then null else b.Q13 end,
    case when length(trim(b.Q14)) = 0 then null else b.Q14 end,
    case when length(trim(b.Q15)) = 0 then null else b.Q15 end,
    case when length(trim(b.Q16)) = 0 then null else b.Q16 end,
    case when length(trim(b.Q17)) = 0 then null else b.Q17 end,
    case when length(trim(b.Q18)) = 0 then null else b.Q18 end,
    case when length(trim(b.Q19)) = 0 then null else b.Q19 end,
    case when length(trim(b.Q20)) = 0 then null else b.Q20 end,
    case when length(trim(b.Q21)) = 0 then null else b.Q21 end,
    case when length(trim(b.Q22)) = 0 then null else b.Q22 end,
    case when length(trim(b.Q23)) = 0 then null else b.Q23 end,
    case when length(trim(b.Q24)) = 0 then null else b.Q24 end,
    case when length(trim(b.Q25)) = 0 then null else b.Q25 end,
    case when length(trim(b.Q26)) = 0 then null else b.Q26 end,
    case when length(trim(b.Q27)) = 0 then null else b.Q27 end,
    case when length(trim(b.Q28)) = 0 then null else b.Q28 end,
    case when length(trim(b.Q29)) = 0 then null else b.Q29 end,
    case when length(trim(b.Q30)) = 0 then null else b.Q30 end,
    case when length(trim(b.Q31)) = 0 then null else b.Q31 end,
    case when length(trim(b.Q32)) = 0 then null else b.Q32 end,
    case when length(trim(b.Q33)) = 0 then null else b.Q33 end,
    case when length(trim(b.Q34)) = 0 then null else b.Q34 end,
    case when length(trim(b.Q35)) = 0 then null else b.Q35 end,
    case when length(trim(b.Q36)) = 0 then null else b.Q36 end,
    case when length(trim(b.Q37)) = 0 then null else b.Q37 end,
    case when length(trim(b.Q38)) = 0 then null else b.Q38 end,
    case when length(trim(b.Q39)) = 0 then null else b.Q39 end,
    case when length(trim(b.Q40)) = 0 then null else b.Q40 end,
    case when length(trim(b.Q41)) = 0 then null else b.Q41 end,
    case when length(trim(b.Q42)) = 0 then null else b.Q42 end,
    case when length(trim(b.Q43)) = 0 then null else b.Q43 end,
    case when length(trim(b.Q44)) = 0 then null else b.Q44 end,
    case when length(trim(b.Q45)) = 0 then null else b.Q45 end,
    case when length(trim(b.Q46)) = 0 then null else b.Q46 end,
    case when length(trim(b.Q47)) = 0 then null else b.Q47 end,
    case when length(trim(b.Q48)) = 0 then null else b.Q48 end,
    case when length(trim(b.Q49)) = 0 then null else b.Q49 end,
    case when length(trim(b.Q50)) = 0 then null else b.Q50 end,
    case when length(trim(b.Q51)) = 0 then null else b.Q51 end,
    case when length(trim(b.Q52)) = 0 then null else b.Q52 end,
    case when length(trim(b.Q53)) = 0 then null else b.Q53 end,
    case when length(trim(b.Q54)) = 0 then null else b.Q54 end,
    case when length(trim(b.Q55)) = 0 then null else b.Q55 end,
    case when length(trim(b.Q56)) = 0 then null else b.Q56 end,
    case when length(trim(b.Q57)) = 0 then null else b.Q57 end,
    case when length(trim(b.Q58)) = 0 then null else b.Q58 end,
    case when length(trim(b.Q59)) = 0 then null else b.Q59 end,
    case when length(trim(b.Q60)) = 0 then null else b.Q60 end,
    case when length(trim(b.Q61)) = 0 then null else b.Q61 end,
    case when length(trim(b.Q62)) = 0 then null else b.Q62 end
from tmp_dados a join tmp_socioeconomico b using (NU_INSCRICAO)
where IN_PRESENCA_CH != 0 or
      IN_PRESENCA_CN != 0 or
      IN_PRESENCA_LC != 0 or
      IN_PRESENCA_MT != 0;

insert into debug values('Populating itens table...', curtime());

insert into itens(ID, ID_PROVA, GABARITO, ID_HABILIDADE)
select ID_ITEM, COD_AREA, DS_GABARITO, ID_HABILIDADE
from tmp_itens where ID_PROVA in (137,141) order by 2, 1;

insert into itens(ID, ID_PROVA, GABARITO, ID_HABILIDADE)
select ID_ITEM, COD_AREA, DS_GABARITO, ID_HABILIDADE
from tmp_itens where ID_PROVA = 145 and
ID_POSICAO not like '%i' and ID_POSICAO not like '%e' order by 2, 1;

insert into itens(ID, ID_PROVA, GABARITO, ID_HABILIDADE)
select ID_ITEM, COD_AREA, DS_GABARITO, ID_HABILIDADE
from tmp_itens where ID_PROVA = 145 and ID_POSICAO like '%i' order by 2, 1;

insert into itens(ID, ID_PROVA, GABARITO, ID_HABILIDADE)
select ID_ITEM, COD_AREA, DS_GABARITO, ID_HABILIDADE
from tmp_itens where ID_PROVA = 145 and ID_POSICAO like '%e' order by 2, 1;

insert into itens(ID, ID_PROVA, GABARITO, ID_HABILIDADE)
select ID_ITEM, COD_AREA, DS_GABARITO, ID_HABILIDADE
from tmp_itens where ID_PROVA = 149;

update itens set id_posicao = 1, a = 1.639847737, b = 2.1674361422, c = 0.1643086459 where id = 5773;
update itens set id_posicao = 2, a = 2.009309313, b = 2.5268453068, c = 0.1711438565 where id = 6086;
update itens set id_posicao = 1, a = 1.586710533, b = 0.6575632622, c = 0.2057323799 where id = 6899;
update itens set id_posicao = 2, a = 1.2173935071, b = 1.6239314623, c = 0.047047768 where id = 7012;
update itens set id_posicao = 3, a = 1.2922523435, b = 0.2647658569, c = 0.0804975204 where id = 7031;
update itens set id_posicao = 1, a = 0.5918979166, b = -0.0939340425, c = 0.0012611005 where id = 7111;
update itens set id_posicao = 2, a = 2.2381593714, b = 1.3210974339, c = 0.2229544719 where id = 7157;
update itens set id_posicao = 3, a = 0.4105401184, b = 1.4043614449, c = 0.0148101117 where id = 7174;
update itens set id_posicao = 4, a = 1.3994658192, b = -0.4113098428, c = 0.0066374001 where id = 7179;
update itens set id_posicao = 5, a = 0.89156523, b = 2.6757538046, c = 0.0925849613 where id = 7241;
update itens set id_posicao = 4, a = 1.8768410562, b = -0.4695391638, c = 0.0917567198 where id = 7282;
update itens set id_posicao = 5, a = 2.625823631, b = 1.2396984489, c = 0.1869623026 where id = 7291;
update itens set id_posicao = 6, a = 3.8622601386, b = 2.3546799663, c = 0.1757384103 where id = 7318;
update itens set id_posicao = 7, a = 3.6930202529, b = 1.2016248658, c = 0.1803514572 where id = 7324;
update itens set id_posicao = 6, a = 1.1238813287, b = -1.2449457782, c = 0.000466042 where id = 7350;
update itens set id_posicao = 1, a = 1.1083237334, b = 1.8406740564, c = 0.1122498324 where id = 7394;
update itens set id_posicao = 8, a = 2.916274771, b = 2.5235018922, c = 0.1223957178 where id = 7421;
update itens set id_posicao = 2, a = 2.6765151775, b = 1.345451753, c = 0.1575386497 where id = 7520;
update itens set id_posicao = 3, a = 1.1205223572, b = 0.4069197996, c = 0.3485390596 where id = 7526;
update itens set id_posicao = 4, a = 1.8987205068, b = 1.2458151101, c = 0.1954711182 where id = 7530;
update itens set id_posicao = 5, a = 0.9296261828, b = 2.8418808848, c = 0.1880611417 where id = 7538;
update itens set id_posicao = 3, a = 0.1069031409, b = 23.6969222627, c = 0.1834150658 where id = 7559;
update itens set id_posicao = 4, a = 3.626569926, b = 1.1526239142, c = 0.3618307203 where id = 7569;
update itens set id_posicao = 5, a = 2.0245684507, b = 1.5787479707, c = 0.2939059145 where id = 7572;
update itens set id_posicao = 6, a = 2.1859407617, b = 1.188626821, c = 0.2911012074 where id = 7586;
update itens set id_posicao = 7, a = 1.7086161689, b = 0.0441098537, c = 3.84852959499515E-005 where id = 7589;
update itens set id_posicao = 8, a = -19.6056828805, b = -4.5919038144, c = 0.1242059492 where id = 7592;
update itens set id_posicao = 9, a = 0.9235026982, b = 1.1697166686, c = 1.74107712654718E-005 where id = 7597;
update itens set id_posicao = 10, a = 1.1081911078, b = 0.8354090247, c = 0.0006725477 where id = 7600;
update itens set id_posicao = 9, a = 2.3637222695, b = 1.3871487295, c = 0.2070280986 where id = 7603;
update itens set id_posicao = 11, a = 1.3644412121, b = -0.2359086366, c = 0.0194300442 where id = 7612;
update itens set id_posicao = 7, a = 1.2887115394, b = 0.9248460467, c = 0.0964883934 where id = 7691;
update itens set id_posicao = 8, a = 1.0293094124, b = 0.2720674067, c = 0.0426956432 where id = 7714;
update itens set id_posicao = 6, a = 1.8941619749, b = 1.8251804911, c = 0.1875170602 where id = 7717;
update itens set id_posicao = 7, a = 1.6486801813, b = 1.5565718689, c = 0.0539120678 where id = 7720;
update itens set id_posicao = 8, a = 2.0575138591, b = 1.3943845896, c = 0.1629583312 where id = 7721;
update itens set id_posicao = 10, a = 2.796188179, b = 0.8652091178, c = 0.1533840018 where id = 7725;
update itens set id_posicao = 12, a = 1.7933455254, b = 0.5042763617, c = 0.0333383321 where id = 7795;
update itens set id_posicao = 9, a = 1.6644830917, b = 3.0398661298, c = 0.1957279512 where id = 7859;
update itens set id_posicao = 9, a = 1.3745048397, b = 1.2080894229, c = 0.1097585629 where id = 7884;
update itens set id_posicao = 11, a = 3.2401393766, b = 1.9931850255, c = 0.2055697548 where id = 7890;
update itens set id_posicao = 13, a = 1.2976855119, b = 1.0712257084, c = 9.23111782779396E-005 where id = 7952;
update itens set id_posicao = 14, a = 1.7327290634, b = 2.1227036585, c = 0.1427145194 where id = 7971;
update itens set id_posicao = 15, a = 1.7184229107, b = -0.1007877969, c = 0.0001298778 where id = 8011;
update itens set id_posicao = 10, a = 0.62207291, b = -0.7470281995, c = 0.0015343237 where id = 8039;
update itens set id_posicao = 16, a = 2.2027331801, b = 0.9184758577, c = 0.256213108 where id = 8102;
update itens set id_posicao = 17, a = 1.9354799014, b = 0.3546636399, c = 0.1570556017 where id = 8120;
update itens set id_posicao = 18, a = 3.0036553243, b = 1.3296363632, c = 0.2666638023 where id = 8166;
update itens set id_posicao = 12, a = 3.8527244611, b = 2.1491448396, c = 0.2111803656 where id = 8371;
update itens set id_posicao = 13, a = 1.84267219, b = 0.6661524617, c = 0.1590101144 where id = 8405;
update itens set id_posicao = 19, a = 0.4302073184, b = 2.9472043393, c = 0.0145167975 where id = 8416;
update itens set id_posicao = 20, a = 2.1187158146, b = 1.7595201127, c = 0.1521481408 where id = 8424;
update itens set id_posicao = 14, a = 2.0857048396, b = 0.5729546107, c = 0.133725273 where id = 8428;
update itens set id_posicao = 21, a = 1.3926181345, b = 1.1999543309, c = 0.1551651205 where id = 8438;
update itens set id_posicao = 15, a = 1.9323809018, b = 1.8751255518, c = 0.2667724902 where id = 8439;
update itens set id_posicao = 16, a = 1.2448328118, b = -1.6496197568, c = 0.0011772033 where id = 8444;
update itens set id_posicao = 22, a = 2.3215598769, b = 1.3148738494, c = 0.1156228855 where id = 8447;
update itens set id_posicao = 23, a = 1.0396057857, b = -0.0097135627, c = 0.00015365 where id = 8450;
update itens set id_posicao = 24, a = 1.4119999212, b = -0.1660168209, c = 0.0985433403 where id = 8451;
update itens set id_posicao = 25, a = 1.7580759556, b = 0.6465605791, c = 0.1532761776 where id = 8452;
update itens set id_posicao = 26, a = 0.2404203228, b = 7.3982835155, c = 0.0184753316 where id = 8454;
update itens set id_posicao = 27, a = 1.1339244747, b = 0.8607539286, c = 0.0001717418 where id = 8503;
update itens set id_posicao = 17, a = 0.5776222842, b = 0.5656758828, c = 0.0056022347 where id = 8504;
update itens set id_posicao = 10, a = 1.1106264226, b = -1.8518620334, c = 9.61530621395967E-005 where id = 8716;
update itens set id_posicao = 11, a = 1.3176527383, b = -0.1241103386, c = 0.1274899444 where id = 8806;
update itens set id_posicao = 18, a = 0.8927030515, b = 1.4373601087, c = 0.1469613182 where id = 8930;
update itens set id_posicao = 12, a = 1.0675136443, b = 2.0233988622, c = 0.139488194 where id = 8971;
update itens set id_posicao = 11, a = 1.4310238707, b = 1.5913497392, c = 0.2954822847 where id = 8987;
update itens set id_posicao = 12, a = 0.7160109997, b = 2.3793689207, c = 0.1518705726 where id = 8998;
update itens set id_posicao = 28, a = 0.7304823757, b = 2.0630135794, c = 0.0022474221 where id = 9054;
update itens set id_posicao = 29, a = 2.8714486779, b = 1.9530487705, c = 0.2368453456 where id = 9101;
update itens set id_posicao = 13, a = 0.5450351358, b = 2.6149012024, c = 0.2298887697 where id = 9167;
update itens set id_posicao = 19, a = 2.1347136562, b = 3.0533286888, c = 0.1629662057 where id = 9173;
update itens set id_posicao = 20, a = 1.4648226865, b = -0.3892478638, c = 0.0182662663 where id = 9207;
update itens set id_posicao = 21, a = 5.4495079948, b = 2.2067695936, c = 0.1566172241 where id = 9214;
update itens set id_posicao = 30, a = 0.8519435129, b = 0.2796532906, c = 3.71535606680426E-005 where id = 9218;
update itens set id_posicao = 14, a = 1.6903225653, b = 0.5834493702, c = 0.1425486159 where id = 9258;
update itens set id_posicao = 15, a = 1.2779921381, b = 0.075471344, c = 0.2466490785 where id = 9267;
update itens set id_posicao = 16, a = 1.1481640753, b = 1.5387389872, c = 0.1131472797 where id = 9317;
update itens set id_posicao = 22, a = 4.0265165861, b = 1.676639021, c = 0.1746810436 where id = 9577;
update itens set id_posicao = 17, a = 0.7864343403, b = -0.4035074949, c = 0.0003152024 where id = 9628;
update itens set id_posicao = 31, a = 1.2461094849, b = -0.4484921158, c = 0.0003123887 where id = 9689;
update itens set id_posicao = 32, a = 4.7122802358, b = 1.3372253546, c = 0.4933532738 where id = 9690;
update itens set id_posicao = 13, a = 2.5328866025, b = 2.2299379991, c = 0.2273126959 where id = 9749;
update itens set id_posicao = 18, a = 0.4768576271, b = 1.864662205, c = 0.06558623 where id = 9843;
update itens set id_posicao = 23, a = 1.9583957861, b = 1.5011979746, c = 0.1422732978 where id = 9909;
update itens set id_posicao = 19, a = 1.5891933538, b = 1.0571922204, c = 0.1938631148 where id = 9917;
update itens set id_posicao = 14, a = 2.7467267135, b = 1.627052038, c = 0.1569171259 where id = 10124;
update itens set id_posicao = 20, a = 1.1746833182, b = 1.5320578595, c = 0.1413013642 where id = 10128;
update itens set id_posicao = 21, a = 0.8382655014, b = 2.6735752389, c = 0.2182705678 where id = 10167;
update itens set id_posicao = 24, a = 2.442511596, b = 0.4349215557, c = 0.1927358109 where id = 10181;
update itens set id_posicao = 25, a = 2.619263302, b = 0.9922638621, c = 0.1674538651 where id = 10300;
update itens set id_posicao = 22, a = 2.0500764526, b = 2.2936116278, c = 0.1400414235 where id = 10352;
update itens set id_posicao = 26, a = 2.5390195754, b = 3.1029900013, c = 0.1220844787 where id = 10441;
update itens set id_posicao = 23, a = 2.2270270803, b = 1.4032738133, c = 0.1401752934 where id = 10467;
update itens set id_posicao = 27, a = 2.3604331879, b = 1.1667945076, c = 0.1444224054 where id = 10547;
update itens set id_posicao = 15, a = 1.8436000697, b = 0.9604476842, c = 0.2181426434 where id = 10549;
update itens set id_posicao = 24, a = 0.6788828933, b = -0.8629795094, c = 0.0009389702 where id = 10609;
update itens set id_posicao = 16, a = 2.2345412863, b = 0.887896186, c = 0.2443103684 where id = 10698;
update itens set id_posicao = 25, a = 1.3867067427, b = 0.6190631111, c = 0.2098811425 where id = 10744;
update itens set id_posicao = 17, a = 1.1400462044, b = 3.2801735981, c = 0.1407419869 where id = 10766;
update itens set id_posicao = 18, a = 1.1706309406, b = 1.645444986, c = 0.119740562 where id = 10813;
update itens set id_posicao = 28, a = 1.6341135903, b = -0.4315501523, c = 0.1358535717 where id = 10823;
update itens set id_posicao = 29, a = 1.4672611051, b = 1.7985795832, c = 0.1079658305 where id = 10896;
update itens set id_posicao = 19, a = 4.0695626754, b = 2.2858952049, c = 0.2280329071 where id = 10925;
update itens set id_posicao = 33, a = 1.9013689258, b = 0.6418770135, c = 0.1010079315 where id = 10932;
update itens set id_posicao = 26, a = 1.5986238024, b = 1.0266959118, c = 0.1922028837 where id = 10936;
update itens set id_posicao = 30, a = 2.2364053161, b = 2.6355982198, c = 0.127079395 where id = 11010;
update itens set id_posicao = 34, a = 0.5880658155, b = 2.337623848, c = 0.0006683497 where id = 11047;
update itens set id_posicao = 20, a = 1.4785279924, b = 3.241171163, c = 0.0508974428 where id = 11088;
update itens set id_posicao = 27, a = 1.5125721809, b = 0.362243007, c = 0.2932589065 where id = 11100;
update itens set id_posicao = 28, a = 1.6307385845, b = 1.8692312119, c = 0.1908501789 where id = 11131;
update itens set id_posicao = 35, a = 1.1967427347, b = 0.3457066721, c = 0.0763671826 where id = 11330;
update itens set id_posicao = 31, a = 2.2220029151, b = 1.3435929103, c = 0.1438621277 where id = 11343;
update itens set id_posicao = 36, a = 0.3028747469, b = 4.8143489554, c = 0.0048964978 where id = 11449;
update itens set id_posicao = 21, a = 3.0687403422, b = 2.0710712086, c = 0.1518283972 where id = 11471;
update itens set id_posicao = 22, a = 1.7819272248, b = 2.9137887275, c = 0.1261549301 where id = 11473;
update itens set id_posicao = 32, a = 2.0366924115, b = -0.0020027803, c = 0.0930690305 where id = 11521;
update itens set id_posicao = 29, a = 0.1159398293, b = 7.240850284, c = 0.0090400795 where id = 11524;
update itens set id_posicao = 37, a = 1.8328088563, b = 1.9719124106, c = 0.1755068304 where id = 11559;
update itens set id_posicao = 30, a = 0.2466262505, b = 1.7301204594, c = 0.01152114 where id = 11637;
update itens set id_posicao = 31, a = 2.7343257444, b = 2.0092495701, c = 0.1241294749 where id = 11818;
update itens set id_posicao = 32, a = 1.8032200048, b = 0.7653856383, c = 0.1205567909 where id = 11849;
update itens set id_posicao = 33, a = 1.3443586257, b = 0.5147538345, c = 0.1829082094 where id = 11950;
update itens set id_posicao = 23, a = 1.7074337204, b = 1.3899829949, c = 0.1304706517 where id = 11971;
update itens set id_posicao = 24, a = 2.8957082307, b = 1.7373256098, c = 0.1992110009 where id = 12016;
update itens set id_posicao = 38, a = 1.3406693575, b = 1.3629320046, c = 0.2383753328 where id = 12077;
update itens set id_posicao = 34, a = 1.4142540358, b = 1.4756991059, c = 0.2346566651 where id = 12096;
update itens set id_posicao = 33, a = 1.4774653445, b = 2.5535504492, c = 0.1977526417 where id = 12105;
update itens set id_posicao = 35, a = 1.1298903634, b = -0.4736196045, c = 0.000892578 where id = 12213;
update itens set id_posicao = 36, a = 1.3048373162, b = 2.4672317196, c = 0.1757058655 where id = 12235;
update itens set id_posicao = 25, a = 0.3866205265, b = 4.5494280131, c = 0.0015261879 where id = 12242;
update itens set id_posicao = 26, a = 1.9330364644, b = 1.9007404742, c = 0.1317207024 where id = 12246;
update itens set id_posicao = 34, a = 1.763027307, b = 0.9358781195, c = 0.278670417 where id = 12252;
update itens set id_posicao = 27, a = 2.7680363553, b = 2.5586787658, c = 0.1643025712 where id = 12313;
update itens set id_posicao = 37, a = 0.6799555305, b = 0.4425450926, c = 0.0805114765 where id = 12402;
update itens set id_posicao = 28, a = 3.5136621614, b = 1.7967132296, c = 0.1657260901 where id = 12466;
update itens set id_posicao = 35, a = 1.3954914118, b = -0.0266297678, c = 0.0734387076 where id = 12533;
update itens set id_posicao = 36, a = 1.6611426316, b = 0.4083446664, c = 0.2110533235 where id = 12730;
update itens set id_posicao = 37, a = 3.3384580281, b = 1.5993484849, c = 0.2586913389 where id = 12765;
update itens set id_posicao = 38, a = 0.5165141955, b = 2.3326558138, c = 0.1108419873 where id = 13064;
update itens set id_posicao = 39, a = 1.5122608259, b = 0.8289415763, c = 0.1786989185 where id = 13091;
update itens set id_posicao = 29, a = 2.5002341, b = 1.855830509, c = 0.1391464392 where id = 13100;
update itens set id_posicao = 40, a = 1.1105581601, b = 1.9628526966, c = 0.1880950721 where id = 13152;
update itens set id_posicao = 30, a = 1.8529537698, b = 2.4065724534, c = 0.2461178791 where id = 13155;
update itens set id_posicao = 41, a = 0.0964456619, b = 11.1631698338, c = 0.0033314286 where id = 13161;
update itens set id_posicao = 42, a = 1.3329157963, b = 0.4119717041, c = 0.0704839514 where id = 13273;
update itens set id_posicao = 43, a = 0.770467382, b = 0.5068561771, c = 0.1683936784 where id = 13388;
update itens set id_posicao = 44, a = 1.1534611631, b = 0.7912437336, c = 0.0860376087 where id = 13440;
update itens set id_posicao = 31, a = 0.6521473387, b = -1.2668251903, c = 0.00000178 where id = 13470;
update itens set id_posicao = 45, a = 0.6089857536, b = -0.8322173702, c = 0.0871402307 where id = 13475;
update itens set id_posicao = 41, a = 0.7004026008, b = 4.3133081862, c = 0.0967331305 where id = 13476;
update itens set id_posicao = 32, a = 2.2887373917, b = 0.9345367793, c = 0.2342064518 where id = 13481;
update itens set id_posicao = 33, a = 1.6441611216, b = 1.0359106566, c = 0.2549865585 where id = 13577;
update itens set id_posicao = 34, a = 0.7256405794, b = 1.5089657887, c = 0.132855507 where id = 13601;
update itens set id_posicao = 35, a = 2.4649800284, b = 1.8118131337, c = 0.3142201842 where id = 13701;
update itens set id_posicao = 36, a = 1.7913777334, b = -0.3281437779, c = 0.0015135776 where id = 13755;
update itens set id_posicao = 39, a = 1.6226389843, b = 1.4196733676, c = 0.1220568242 where id = 13850;
update itens set id_posicao = 38, a = 1.7968504728, b = 1.2793991432, c = 0.2934473226 where id = 13915;
update itens set id_posicao = 40, a = 0.4430480922, b = 2.4819212124, c = 0.00097632 where id = 13971;
update itens set id_posicao = 41, a = 1.9700208356, b = 1.2314411854, c = 0.1773534689 where id = 14075;
update itens set id_posicao = 42, a = 3.1276131497, b = 0.7845157091, c = 0.3469906118 where id = 14121;
update itens set id_posicao = 37, a = 2.8749918831, b = 2.181577275, c = 0.3227949466 where id = 14148;
update itens set id_posicao = 38, a = 3.4998733388, b = 2.6629675042, c = 0.2734122341 where id = 14165;
update itens set id_posicao = 43, a = 1.048327726, b = 3.1262173875, c = 0.3008964213 where id = 14192;
update itens set id_posicao = 39, a = 2.4118699246, b = 0.4651698374, c = 0.1260282058 where id = 14393;
update itens set id_posicao = 44, a = 1.9263246849, b = -0.0405535589, c = 0.0481764236 where id = 14529;
update itens set id_posicao = 39, a = 0.3515785128, b = 3.539977347, c = 0.0137345313 where id = 14938;
update itens set id_posicao = 40, a = 2.1948687382, b = 1.7854280228, c = 0.2277141587 where id = 14939;
update itens set id_posicao = 41, a = 1.4640640921, b = 1.1183313831, c = 0.1338191857 where id = 14952;
update itens set id_posicao = 42, a = 0.8478339221, b = 2.2080040061, c = 0.1235471926 where id = 14970;
update itens set id_posicao = 43, a = 1.3387175378, b = 3.2553927327, c = 0.1389267357 where id = 14971;
update itens set id_posicao = 44, a = 2.1147088156, b = 2.2459556878, c = 0.1221199514 where id = 14980;
update itens set id_posicao = 45, a = 2.2297108293, b = 2.2406109022, c = 0.1162970186 where id = 14982;
update itens set id_posicao = 42, a = -1.2489399396, b = -0.2508483386, c = 0.1415350969 where id = 15020;
update itens set id_posicao = 43, a = 0.1028292353, b = 21.5753699161, c = 0.0919011436 where id = 15064;
update itens set id_posicao = 44, a = 0.7734787655, b = 3.854938635, c = 0.0978042768 where id = 15094;
update itens set id_posicao = 45, a = 1.220159619, b = 3.1136785176, c = 0.0824087061 where id = 15123;
update itens set id_posicao = 45, a = 0.3374244811, b = 4.246355981, c = 0.0044765294 where id = 15288;
update itens set id_posicao = 40, a = 0.5008028074, b = 0.6342504541, c = 0.0018392535 where id = 15307;
update itens set id_posicao = 41, a = 2.1724329511, b = 2.0246486522, c = 0.1836409121 where id = 15395;
update itens set id_posicao = 42, a = 2.242597716, b = 1.2216936052, c = 0.0996317828 where id = 15402;
update itens set id_posicao = 43, a = 2.6940397475, b = 2.0420223889, c = 0.2368669621 where id = 15446;
update itens set id_posicao = 44, a = 1.8556859892, b = -0.1538908062, c = 0.0967201987 where id = 15453;
update itens set id_posicao = 45, a = 1.0750053035, b = 1.7166246736, c = 0.1471405105 where id = 15460;

insert into debug values('Ordering responses from test 1 of 25', curtime());

update alunos join tmp_dados on alunos.INSCRICAO = tmp_dados.NU_INSCRICAO
set alunos.RESPOSTAS_CH = concat(
    substring(tmp_dados.TX_RESPOSTAS_CH, 18, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 33, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 35, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 21, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 17, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 13, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 15, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 12, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 16, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 22, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 41, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 08, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 01, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 45, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 06, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 04, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 19, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 24, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 14, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 39, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 38, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 26, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 10, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 42, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 32, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 20, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 11, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 09, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 30, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 25, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 05, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 02, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 28, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 03, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 43, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 31, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 44, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 37, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 29, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 23, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 27, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 07, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 34, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 40, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 36, 1))
where tmp_dados.ID_PROVA_CH = 137;

insert into debug values('Ordering responses from test 2 of 25', curtime());

update alunos join tmp_dados on alunos.INSCRICAO = tmp_dados.NU_INSCRICAO
set alunos.RESPOSTAS_CH = concat(
    substring(tmp_dados.TX_RESPOSTAS_CH, 08, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 29, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 31, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 16, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 07, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 20, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 05, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 19, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 06, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 22, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 44, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 04, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 09, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 35, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 02, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 18, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 14, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 38, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 21, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 42, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 41, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 36, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 12, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 45, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 28, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 15, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 13, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 11, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 26, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 39, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 01, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 10, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 24, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 17, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 33, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 27, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 34, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 40, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 25, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 23, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 37, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 03, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 30, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 43, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 32, 1))
where tmp_dados.ID_PROVA_CH = 138;

insert into debug values('Ordering responses from test 3 of 25', curtime());

update alunos join tmp_dados on alunos.INSCRICAO = tmp_dados.NU_INSCRICAO
set alunos.RESPOSTAS_CH = concat(
    substring(tmp_dados.TX_RESPOSTAS_CH, 08, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 29, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 31, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 16, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 07, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 20, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 05, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 19, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 06, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 22, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 44, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 04, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 09, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 35, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 02, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 18, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 14, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 38, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 21, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 42, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 41, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 36, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 12, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 45, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 28, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 15, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 13, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 11, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 26, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 39, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 01, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 10, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 24, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 17, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 33, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 27, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 34, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 40, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 25, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 23, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 37, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 03, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 30, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 43, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 32, 1))
where tmp_dados.ID_PROVA_CH = 139;

insert into debug values('Ordering responses from test 4 of 25', curtime());

update alunos join tmp_dados on alunos.INSCRICAO = tmp_dados.NU_INSCRICAO
set alunos.RESPOSTAS_CH = concat(
    substring(tmp_dados.TX_RESPOSTAS_CH, 27, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 20, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 22, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 03, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 26, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 05, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 24, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 04, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 25, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 34, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 32, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 16, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 11, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 38, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 14, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 18, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 01, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 39, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 06, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 43, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 42, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 44, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 29, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 33, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 19, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 02, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 30, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 28, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 09, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 40, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 13, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 12, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 07, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 17, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 36, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 10, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 37, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 41, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 08, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 35, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 45, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 15, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 21, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 31, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 23, 1))
where tmp_dados.ID_PROVA_CH = 140;

insert into debug values('Ordering responses from test 5 of 25', curtime());

update alunos join tmp_dados on alunos.INSCRICAO = tmp_dados.NU_INSCRICAO
set alunos.RESPOSTAS_CH = concat(
    substring(tmp_dados.TX_RESPOSTAS_CH, 08, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 09, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 29, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 31, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 16, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 07, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 20, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 05, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 19, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 22, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 44, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 06, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 04, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 35, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 02, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 18, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 14, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 21, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 42, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 41, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 36, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 12, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 45, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 28, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 15, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 13, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 11, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 26, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 39, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 01, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 10, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 38, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 24, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 17, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 33, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 27, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 34, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 40, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 25, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 23, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 37, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 03, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 30, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 43, 1),
    substring(tmp_dados.TX_RESPOSTAS_CH, 32, 1))
where tmp_dados.ID_PROVA_CH = 154;

insert into debug values('Ordering responses from test 6 of 25', curtime());

update alunos join tmp_dados on alunos.INSCRICAO = tmp_dados.NU_INSCRICAO
set alunos.RESPOSTAS_CN = concat(
    substring(tmp_dados.TX_RESPOSTAS_CN, 23, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 19, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 35, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 18, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 42, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 31, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 01, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 36, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 17, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 05, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 11, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 32, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 14, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 37, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 06, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 27, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 28, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 16, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 15, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 10, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 20, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 25, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 09, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 41, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 12, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 44, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 21, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 45, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 04, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 33, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 07, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 02, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 24, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 40, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 13, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 26, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 34, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 22, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 39, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 30, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 08, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 03, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 29, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 38, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 43, 1))
where tmp_dados.ID_PROVA_CN = 141;

insert into debug values('Ordering responses from test 7 of 25', curtime());

update alunos join tmp_dados on alunos.INSCRICAO = tmp_dados.NU_INSCRICAO
set alunos.RESPOSTAS_CN = concat(
    substring(tmp_dados.TX_RESPOSTAS_CN, 43, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 17, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 41, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 03, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 30, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 25, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 13, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 38, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 02, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 09, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 26, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 06, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 29, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 39, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 10, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 21, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 22, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 01, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 08, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 05, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 18, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 45, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 04, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 37, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 27, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 32, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 19, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 33, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 16, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 07, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 11, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 14, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 44, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 36, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 28, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 20, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 40, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 42, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 35, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 24, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 12, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 15, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 23, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 34, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 31, 1))
where tmp_dados.ID_PROVA_CN = 142;

insert into debug values('Ordering responses from test 8 of 25', curtime());

update alunos join tmp_dados on alunos.INSCRICAO = tmp_dados.NU_INSCRICAO
set alunos.RESPOSTAS_CN = concat(
    substring(tmp_dados.TX_RESPOSTAS_CN, 18, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 12, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 45, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 11, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 29, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 35, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 05, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 42, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 10, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 01, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 22, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 40, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 25, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 43, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 02, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 27, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 28, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 09, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 21, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 16, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 13, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 20, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 15, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 39, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 23, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 31, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 14, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 32, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 08, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 41, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 03, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 06, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 19, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 38, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 24, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 26, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 44, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 17, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 37, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 34, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 04, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 07, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 33, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 36, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 30, 1))
where tmp_dados.ID_PROVA_CN = 143;

insert into debug values('Ordering responses from test 9 of 25', curtime());

update alunos join tmp_dados on alunos.INSCRICAO = tmp_dados.NU_INSCRICAO
set alunos.RESPOSTAS_CN = concat(
    substring(tmp_dados.TX_RESPOSTAS_CN, 32, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 28, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 39, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 27, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 08, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 37, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 21, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 40, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 26, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 13, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 01, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 19, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 04, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 41, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 14, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 06, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 07, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 25, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 12, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 18, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 29, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 34, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 17, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 45, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 02, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 10, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 30, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 11, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 24, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 20, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 15, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 22, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 33, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 44, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 03, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 05, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 38, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 31, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 43, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 36, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 16, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 23, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 35, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 42, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 09, 1))
where tmp_dados.ID_PROVA_CN = 144;

insert into debug values('Ordering responses from test 10 of 25', curtime());

update alunos join tmp_dados on alunos.INSCRICAO = tmp_dados.NU_INSCRICAO
set alunos.RESPOSTAS_CN = concat(
    substring(tmp_dados.TX_RESPOSTAS_CN, 18, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 41, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 08, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 12, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 17, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 45, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 11, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 29, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 35, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 05, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 42, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 33, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 10, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 01, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 40, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 16, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 21, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 31, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 25, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 43, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 02, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 27, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 09, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 13, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 20, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 15, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 39, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 23, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 28, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 44, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 32, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 03, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 06, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 19, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 38, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 24, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 26, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 37, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 34, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 22, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 04, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 07, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 36, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 30, 1),
    substring(tmp_dados.TX_RESPOSTAS_CN, 14, 1))
where tmp_dados.ID_PROVA_CN = 153;

insert into debug values('Ordering responses from test 11 of 25', curtime());

update alunos join tmp_dados on alunos.INSCRICAO = tmp_dados.NU_INSCRICAO
set alunos.RESPOSTAS_MT = concat(
    substring(tmp_dados.TX_RESPOSTAS_MT, 43, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 28, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 19, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 25, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 18, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 41, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 33, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 29, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 16, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 21, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 14, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 42, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 36, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 24, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 44, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 05, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 15, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 11, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 38, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 07, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 30, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 45, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 04, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 10, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 20, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 37, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 01, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 06, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 31, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 40, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 17, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 09, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 39, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 35, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 08, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 22, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 12, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 34, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 23, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 27, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 26, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 02, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 13, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 32, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 03, 1))
where tmp_dados.ID_PROVA_MT = 149;

insert into debug values('Ordering responses from test 12 of 25', curtime());

update alunos join tmp_dados on alunos.INSCRICAO = tmp_dados.NU_INSCRICAO
set alunos.RESPOSTAS_MT = concat(
    substring(tmp_dados.TX_RESPOSTAS_MT, 31, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 20, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 07, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 45, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 37, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 26, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 38, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 21, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 35, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 09, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 17, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 30, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 41, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 44, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 32, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 01, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 34, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 14, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 23, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 03, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 27, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 33, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 13, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 06, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 08, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 22, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 10, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 02, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 28, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 25, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 36, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 05, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 24, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 40, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 04, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 42, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 15, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 39, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 43, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 19, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 18, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 11, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 16, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 29, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 12, 1))
where tmp_dados.ID_PROVA_MT = 150;

insert into debug values('Ordering responses from test 13 of 25', curtime());

update alunos join tmp_dados on alunos.INSCRICAO = tmp_dados.NU_INSCRICAO
set alunos.RESPOSTAS_MT = concat(
    substring(tmp_dados.TX_RESPOSTAS_MT, 34, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 03, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 30, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 29, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 08, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 45, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 37, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 04, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 06, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 32, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 25, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 33, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 40, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 28, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 35, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 13, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 05, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 22, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 42, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 15, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 17, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 36, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 12, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 21, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 31, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 41, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 09, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 14, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 18, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 44, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 07, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 20, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 43, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 39, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 16, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 26, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 23, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 38, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 27, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 02, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 01, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 10, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 24, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 19, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 11, 1))
where tmp_dados.ID_PROVA_MT = 151;

insert into debug values('Ordering responses from test 14 of 25', curtime());

update alunos join tmp_dados on alunos.INSCRICAO = tmp_dados.NU_INSCRICAO
set alunos.RESPOSTAS_MT = concat(
    substring(tmp_dados.TX_RESPOSTAS_MT, 39, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 31, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 26, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 08, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 21, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 37, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 42, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 32, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 19, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 28, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 04, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 38, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 45, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 07, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 40, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 09, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 18, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 01, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 34, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 11, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 13, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 41, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 25, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 17, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 27, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 33, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 22, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 10, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 14, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 36, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 20, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 16, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 35, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 44, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 12, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 05, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 02, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 43, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 06, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 30, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 29, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 23, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 03, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 15, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 24, 1))
where tmp_dados.ID_PROVA_MT = 152;

insert into debug values('Ordering responses from test 15 of 25', curtime());

update alunos join tmp_dados on alunos.INSCRICAO = tmp_dados.NU_INSCRICAO
set alunos.RESPOSTAS_MT = concat(
    substring(tmp_dados.TX_RESPOSTAS_MT, 31, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 20, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 13, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 45, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 37, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 19, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 26, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 38, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 21, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 28, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 35, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 09, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 17, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 30, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 41, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 44, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 32, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 01, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 34, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 14, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 23, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 03, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 27, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 33, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 06, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 08, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 22, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 10, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 25, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 36, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 05, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 02, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 24, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 40, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 04, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 42, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 15, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 39, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 43, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 18, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 11, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 16, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 07, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 29, 1),
    substring(tmp_dados.TX_RESPOSTAS_MT, 12, 1))
where tmp_dados.ID_PROVA_MT = 156;

insert into debug values('Ordering responses from test 16 of 25', curtime());

update alunos join tmp_dados on alunos.INSCRICAO = tmp_dados.NU_INSCRICAO
set alunos.RESPOSTAS_LC = concat(
    substring(tmp_dados.TX_RESPOSTAS_LC, 26, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 28, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 39, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 9, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 32, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 22, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 33, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 23, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 29, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 10, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 14, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 20, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 15, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 12, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 42, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 6, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 44, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 19, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 30, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 7, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 16, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 18, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 27, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 45, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 25, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 38, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 17, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 34, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 37, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 8, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 40, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 13, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 43, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 36, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 11, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 21, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 24, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 35, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 31, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 41, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 3, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 1, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 5, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 2, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 4, 1))
where tmp_dados.ID_PROVA_LC = 145 AND tmp_dados.TP_LINGUA = 0;

insert into debug values('Ordering responses from test 17 of 25', curtime());

update alunos join tmp_dados on alunos.INSCRICAO = tmp_dados.NU_INSCRICAO
set alunos.RESPOSTAS_LC = concat(
    substring(tmp_dados.TX_RESPOSTAS_LC, 20, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 22, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 36, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 10, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 26, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 12, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 27, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 13, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 23, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 11, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 18, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 40, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 42, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 16, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 6, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 33, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 8, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 39, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 24, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 34, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 43, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 45, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 21, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 9, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 19, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 32, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 44, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 28, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 31, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 35, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 37, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 17, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 7, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 30, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 15, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 41, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 14, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 29, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 25, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 38, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 5, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 3, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 2, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 4, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 1, 1))
where tmp_dados.ID_PROVA_LC = 146 AND tmp_dados.TP_LINGUA = 0;

insert into debug values('Ordering responses from test 18 of 25', curtime());

update alunos join tmp_dados on alunos.INSCRICAO = tmp_dados.NU_INSCRICAO
set alunos.RESPOSTAS_LC = concat(
    substring(tmp_dados.TX_RESPOSTAS_LC, 19, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 34, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 39, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 16, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 23, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 24, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 31, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 25, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 35, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 17, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 30, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 11, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 42, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 28, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 6, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 13, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 8, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 10, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 21, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 14, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 43, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 45, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 20, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 9, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 18, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 38, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 44, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 32, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 37, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 15, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 40, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 29, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 7, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 36, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 27, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 12, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 26, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 33, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 22, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 41, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 4, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 3, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 2, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 5, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 1, 1))
where tmp_dados.ID_PROVA_LC = 147 AND tmp_dados.TP_LINGUA = 0;

insert into debug values('Ordering responses from test 19 of 25', curtime());

update alunos join tmp_dados on alunos.INSCRICAO = tmp_dados.NU_INSCRICAO
set alunos.RESPOSTAS_LC = concat(
    substring(tmp_dados.TX_RESPOSTAS_LC, 29, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 31, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 43, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 13, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 27, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 22, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 36, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 23, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 32, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 14, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 21, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 7, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 39, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 19, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 9, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 15, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 11, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 6, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 25, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 16, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 40, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 42, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 30, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 12, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 28, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 35, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 41, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 37, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 34, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 17, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 44, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 20, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 10, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 33, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 18, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 8, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 24, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 38, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 26, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 45, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 3, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 2, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 5, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 1, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 4, 1))
where tmp_dados.ID_PROVA_LC = 148 AND tmp_dados.TP_LINGUA = 0;

insert into debug values('Ordering responses from test 20 of 25', curtime());

update alunos join tmp_dados on alunos.INSCRICAO = tmp_dados.NU_INSCRICAO
set alunos.RESPOSTAS_LC = concat(
    substring(tmp_dados.TX_RESPOSTAS_LC, 20, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 22, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 36, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 10, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 26, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 12, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 27, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 13, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 23, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 11, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 18, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 40, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 42, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 16, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 6, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 33, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 8, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 39, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 24, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 34, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 43, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 45, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 21, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 9, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 19, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 32, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 44, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 28, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 31, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 35, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 37, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 17, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 7, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 30, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 15, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 41, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 14, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 29, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 25, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 38, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 5, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 3, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 2, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 4, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 1, 1))
where tmp_dados.ID_PROVA_LC = 155 AND tmp_dados.TP_LINGUA = 0;

insert into debug values('Ordering responses from test 21 of 25', curtime());

update alunos join tmp_dados on alunos.INSCRICAO = tmp_dados.NU_INSCRICAO
set alunos.RESPOSTAS_LC = concat(
    substring(tmp_dados.TX_RESPOSTAS_LC, 26, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 28, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 39, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 9, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 32, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 22, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 33, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 23, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 29, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 10, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 14, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 20, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 15, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 12, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 42, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 6, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 44, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 19, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 30, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 7, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 16, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 18, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 27, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 45, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 25, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 38, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 17, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 34, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 37, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 8, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 40, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 13, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 43, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 36, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 11, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 21, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 24, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 35, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 31, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 41, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 5, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 1, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 2, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 3, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 4, 1))
where tmp_dados.ID_PROVA_LC = 145 AND tmp_dados.TP_LINGUA = 1;

insert into debug values('Ordering responses from test 22 of 25', curtime());

update alunos join tmp_dados on alunos.INSCRICAO = tmp_dados.NU_INSCRICAO
set alunos.RESPOSTAS_LC = concat(
    substring(tmp_dados.TX_RESPOSTAS_LC, 20, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 22, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 36, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 10, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 26, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 12, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 27, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 13, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 23, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 11, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 18, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 40, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 42, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 16, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 6, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 33, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 8, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 39, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 24, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 34, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 43, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 45, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 21, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 9, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 19, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 32, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 44, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 28, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 31, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 35, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 37, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 17, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 7, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 30, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 15, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 41, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 14, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 29, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 25, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 38, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 4, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 2, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 3, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 1, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 5, 1))
where tmp_dados.ID_PROVA_LC = 146 AND tmp_dados.TP_LINGUA = 1;

insert into debug values('Ordering responses from test 23 of 25', curtime());

update alunos join tmp_dados on alunos.INSCRICAO = tmp_dados.NU_INSCRICAO
set alunos.RESPOSTAS_LC = concat(
    substring(tmp_dados.TX_RESPOSTAS_LC, 19,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 34,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 39,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 16,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 23,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 24,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 31,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 25,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 35,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 17,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 30, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 11,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 42,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 28, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 6 , 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 13,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 8 ,1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 10,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 21, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 14,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 43,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 45,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 20,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 9 ,1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 18,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 38, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 44, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 32,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 37, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 15,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 40,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 29,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 7 , 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 36,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 27,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 12,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 26,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 33, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 22,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 41,  1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 5 , 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 2 , 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 3 , 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 1 , 1),
    substring(tmp_dados.TX_RESPOSTAS_LC, 4 , 1))
where tmp_dados.ID_PROVA_LC = 147 AND tmp_dados.TP_LINGUA = 1;

insert into debug values('Ordering responses from test 24 of 25', curtime());

update alunos join tmp_dados on alunos.INSCRICAO = tmp_dados.NU_INSCRICAO
set alunos.RESPOSTAS_LC = concat(
    substring(tmp_dados.TX_RESPOSTAS_LC,29, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,31, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,43, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,13, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,27, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,22, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,36, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,23, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,32, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,14, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,21,1),
    substring(tmp_dados.TX_RESPOSTAS_LC,7, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,39,1),
    substring(tmp_dados.TX_RESPOSTAS_LC,19,1),
    substring(tmp_dados.TX_RESPOSTAS_LC,9, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,15, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,11,1),
    substring(tmp_dados.TX_RESPOSTAS_LC,6, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,25, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,16,1),
    substring(tmp_dados.TX_RESPOSTAS_LC,40, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,42, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,30, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,12,1),
    substring(tmp_dados.TX_RESPOSTAS_LC,28, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,35,1),
    substring(tmp_dados.TX_RESPOSTAS_LC,41,1),
    substring(tmp_dados.TX_RESPOSTAS_LC,37, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,34, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,17, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,44, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,20, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,10, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,33, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,18, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,8, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,24, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,38, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,26, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,45, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,4,1),
    substring(tmp_dados.TX_RESPOSTAS_LC,3, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,2, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,1, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,5, 1))
where tmp_dados.ID_PROVA_LC = 148 AND tmp_dados.TP_LINGUA = 1;

insert into debug values('Ordering responses from test 25 of 25', curtime());

update alunos join tmp_dados on alunos.INSCRICAO = tmp_dados.NU_INSCRICAO
set alunos.RESPOSTAS_LC = concat(
    substring(tmp_dados.TX_RESPOSTAS_LC,20, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,22, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,36, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,10, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,26, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,12, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,27, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,13, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,23, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,11, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,18,1),
    substring(tmp_dados.TX_RESPOSTAS_LC,40, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,42, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,16,1),
    substring(tmp_dados.TX_RESPOSTAS_LC,6, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,33, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,8,1),
    substring(tmp_dados.TX_RESPOSTAS_LC,39, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,24,1),
    substring(tmp_dados.TX_RESPOSTAS_LC,34, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,43, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,45, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,21, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,9,1),
    substring(tmp_dados.TX_RESPOSTAS_LC,19, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,32,1),
    substring(tmp_dados.TX_RESPOSTAS_LC,44,1),
    substring(tmp_dados.TX_RESPOSTAS_LC,28, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,31,1),
    substring(tmp_dados.TX_RESPOSTAS_LC,35, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,37, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,17, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,7, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,30, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,15, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,41, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,14, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,29,1),
    substring(tmp_dados.TX_RESPOSTAS_LC,25, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,38, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,4, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,2, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,3, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,1, 1),
    substring(tmp_dados.TX_RESPOSTAS_LC,5, 1))
where tmp_dados.ID_PROVA_LC = 155 AND tmp_dados.TP_LINGUA = 1;

insert into debug values('Insert correct responses into the provas table', curtime());

insert into provas(ID, GABARITO) values
('CH', (select concat(
    substring(tmp_dados.DS_GABARITO_CH, 18, 1),
    substring(tmp_dados.DS_GABARITO_CH, 33, 1),
    substring(tmp_dados.DS_GABARITO_CH, 35, 1),
    substring(tmp_dados.DS_GABARITO_CH, 21, 1),
    substring(tmp_dados.DS_GABARITO_CH, 17, 1),
    substring(tmp_dados.DS_GABARITO_CH, 13, 1),
    substring(tmp_dados.DS_GABARITO_CH, 15, 1),
    substring(tmp_dados.DS_GABARITO_CH, 12, 1),
    substring(tmp_dados.DS_GABARITO_CH, 16, 1),
    substring(tmp_dados.DS_GABARITO_CH, 22, 1),
    substring(tmp_dados.DS_GABARITO_CH, 41, 1),
    substring(tmp_dados.DS_GABARITO_CH, 08, 1),
    substring(tmp_dados.DS_GABARITO_CH, 01, 1),
    substring(tmp_dados.DS_GABARITO_CH, 45, 1),
    substring(tmp_dados.DS_GABARITO_CH, 06, 1),
    substring(tmp_dados.DS_GABARITO_CH, 04, 1),
    substring(tmp_dados.DS_GABARITO_CH, 19, 1),
    substring(tmp_dados.DS_GABARITO_CH, 24, 1),
    substring(tmp_dados.DS_GABARITO_CH, 14, 1),
    substring(tmp_dados.DS_GABARITO_CH, 39, 1),
    substring(tmp_dados.DS_GABARITO_CH, 38, 1),
    substring(tmp_dados.DS_GABARITO_CH, 26, 1),
    substring(tmp_dados.DS_GABARITO_CH, 10, 1),
    substring(tmp_dados.DS_GABARITO_CH, 42, 1),
    substring(tmp_dados.DS_GABARITO_CH, 32, 1),
    substring(tmp_dados.DS_GABARITO_CH, 20, 1),
    substring(tmp_dados.DS_GABARITO_CH, 11, 1),
    substring(tmp_dados.DS_GABARITO_CH, 09, 1),
    substring(tmp_dados.DS_GABARITO_CH, 30, 1),
    substring(tmp_dados.DS_GABARITO_CH, 25, 1),
    substring(tmp_dados.DS_GABARITO_CH, 05, 1),
    substring(tmp_dados.DS_GABARITO_CH, 02, 1),
    substring(tmp_dados.DS_GABARITO_CH, 28, 1),
    substring(tmp_dados.DS_GABARITO_CH, 03, 1),
    substring(tmp_dados.DS_GABARITO_CH, 43, 1),
    substring(tmp_dados.DS_GABARITO_CH, 31, 1),
    substring(tmp_dados.DS_GABARITO_CH, 44, 1),
    substring(tmp_dados.DS_GABARITO_CH, 37, 1),
    substring(tmp_dados.DS_GABARITO_CH, 29, 1),
    substring(tmp_dados.DS_GABARITO_CH, 23, 1),
    substring(tmp_dados.DS_GABARITO_CH, 27, 1),
    substring(tmp_dados.DS_GABARITO_CH, 07, 1),
    substring(tmp_dados.DS_GABARITO_CH, 34, 1),
    substring(tmp_dados.DS_GABARITO_CH, 40, 1),
    substring(tmp_dados.DS_GABARITO_CH, 36, 1))
from tmp_dados where tmp_dados.ID_PROVA_CH = 137 limit 1)),
('CN', (select concat(
    substring(tmp_dados.DS_GABARITO_CN, 23, 1),
    substring(tmp_dados.DS_GABARITO_CN, 19, 1),
    substring(tmp_dados.DS_GABARITO_CN, 35, 1),
    substring(tmp_dados.DS_GABARITO_CN, 18, 1),
    substring(tmp_dados.DS_GABARITO_CN, 42, 1),
    substring(tmp_dados.DS_GABARITO_CN, 31, 1),
    substring(tmp_dados.DS_GABARITO_CN, 01, 1),
    substring(tmp_dados.DS_GABARITO_CN, 36, 1),
    substring(tmp_dados.DS_GABARITO_CN, 17, 1),
    substring(tmp_dados.DS_GABARITO_CN, 05, 1),
    substring(tmp_dados.DS_GABARITO_CN, 11, 1),
    substring(tmp_dados.DS_GABARITO_CN, 32, 1),
    substring(tmp_dados.DS_GABARITO_CN, 14, 1),
    substring(tmp_dados.DS_GABARITO_CN, 37, 1),
    substring(tmp_dados.DS_GABARITO_CN, 06, 1),
    substring(tmp_dados.DS_GABARITO_CN, 27, 1),
    substring(tmp_dados.DS_GABARITO_CN, 28, 1),
    substring(tmp_dados.DS_GABARITO_CN, 16, 1),
    substring(tmp_dados.DS_GABARITO_CN, 15, 1),
    substring(tmp_dados.DS_GABARITO_CN, 10, 1),
    substring(tmp_dados.DS_GABARITO_CN, 20, 1),
    substring(tmp_dados.DS_GABARITO_CN, 25, 1),
    substring(tmp_dados.DS_GABARITO_CN, 09, 1),
    substring(tmp_dados.DS_GABARITO_CN, 41, 1),
    substring(tmp_dados.DS_GABARITO_CN, 12, 1),
    substring(tmp_dados.DS_GABARITO_CN, 44, 1),
    substring(tmp_dados.DS_GABARITO_CN, 21, 1),
    substring(tmp_dados.DS_GABARITO_CN, 45, 1),
    substring(tmp_dados.DS_GABARITO_CN, 04, 1),
    substring(tmp_dados.DS_GABARITO_CN, 33, 1),
    substring(tmp_dados.DS_GABARITO_CN, 07, 1),
    substring(tmp_dados.DS_GABARITO_CN, 02, 1),
    substring(tmp_dados.DS_GABARITO_CN, 24, 1),
    substring(tmp_dados.DS_GABARITO_CN, 40, 1),
    substring(tmp_dados.DS_GABARITO_CN, 13, 1),
    substring(tmp_dados.DS_GABARITO_CN, 26, 1),
    substring(tmp_dados.DS_GABARITO_CN, 34, 1),
    substring(tmp_dados.DS_GABARITO_CN, 22, 1),
    substring(tmp_dados.DS_GABARITO_CN, 39, 1),
    substring(tmp_dados.DS_GABARITO_CN, 30, 1),
    substring(tmp_dados.DS_GABARITO_CN, 08, 1),
    substring(tmp_dados.DS_GABARITO_CN, 03, 1),
    substring(tmp_dados.DS_GABARITO_CN, 29, 1),
    substring(tmp_dados.DS_GABARITO_CN, 38, 1),
    substring(tmp_dados.DS_GABARITO_CN, 43, 1))
from tmp_dados where tmp_dados.ID_PROVA_CN = 141 limit 1)),
('LCi', (select concat(
    substring(tmp_dados.DS_GABARITO_LC, 26 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 28 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 39 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 09 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 32 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 22 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 33 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 23 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 29 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 10 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 14 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 20 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 15 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 12 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 42 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 06 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 44 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 19 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 30 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 07 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 16 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 18 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 27 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 45 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 25 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 38 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 17 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 34 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 37 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 08 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 40 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 13 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 43 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 36 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 11 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 21 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 24 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 35 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 31 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 41 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 03, 1),
    substring(tmp_dados.DS_GABARITO_LC, 01, 1),
    substring(tmp_dados.DS_GABARITO_LC, 05, 1),
    substring(tmp_dados.DS_GABARITO_LC, 02, 1),
    substring(tmp_dados.DS_GABARITO_LC, 04, 1))
from tmp_dados where tmp_dados.ID_PROVA_LC = 145 and TP_LINGUA = 0 limit 1)),
('LCe', (select concat(
    substring(tmp_dados.DS_GABARITO_LC, 26 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 28 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 39 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 09 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 32 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 22 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 33 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 23 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 29 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 10 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 14 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 20 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 15 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 12 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 42 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 06 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 44 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 19 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 30 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 07 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 16 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 18 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 27 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 45 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 25 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 38 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 17 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 34 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 37 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 08 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 40 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 13 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 43 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 36 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 11 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 21 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 24 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 35 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 31 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 41 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 05 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 01 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 02 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 03 + 5, 1),
    substring(tmp_dados.DS_GABARITO_LC, 04 + 5, 1))
 from tmp_dados where tmp_dados.ID_PROVA_LC = 145 and TP_LINGUA = 1 limit 1)),
('MT', (select concat(
    substring(tmp_dados.DS_GABARITO_MT, 43, 1),
    substring(tmp_dados.DS_GABARITO_MT, 28, 1),
    substring(tmp_dados.DS_GABARITO_MT, 19, 1),
    substring(tmp_dados.DS_GABARITO_MT, 25, 1),
    substring(tmp_dados.DS_GABARITO_MT, 18, 1),
    substring(tmp_dados.DS_GABARITO_MT, 41, 1),
    substring(tmp_dados.DS_GABARITO_MT, 33, 1),
    substring(tmp_dados.DS_GABARITO_MT, 29, 1),
    substring(tmp_dados.DS_GABARITO_MT, 16, 1),
    substring(tmp_dados.DS_GABARITO_MT, 21, 1),
    substring(tmp_dados.DS_GABARITO_MT, 14, 1),
    substring(tmp_dados.DS_GABARITO_MT, 42, 1),
    substring(tmp_dados.DS_GABARITO_MT, 36, 1),
    substring(tmp_dados.DS_GABARITO_MT, 24, 1),
    substring(tmp_dados.DS_GABARITO_MT, 44, 1),
    substring(tmp_dados.DS_GABARITO_MT, 05, 1),
    substring(tmp_dados.DS_GABARITO_MT, 15, 1),
    substring(tmp_dados.DS_GABARITO_MT, 11, 1),
    substring(tmp_dados.DS_GABARITO_MT, 38, 1),
    substring(tmp_dados.DS_GABARITO_MT, 07, 1),
    substring(tmp_dados.DS_GABARITO_MT, 30, 1),
    substring(tmp_dados.DS_GABARITO_MT, 45, 1),
    substring(tmp_dados.DS_GABARITO_MT, 04, 1),
    substring(tmp_dados.DS_GABARITO_MT, 10, 1),
    substring(tmp_dados.DS_GABARITO_MT, 20, 1),
    substring(tmp_dados.DS_GABARITO_MT, 37, 1),
    substring(tmp_dados.DS_GABARITO_MT, 01, 1),
    substring(tmp_dados.DS_GABARITO_MT, 06, 1),
    substring(tmp_dados.DS_GABARITO_MT, 31, 1),
    substring(tmp_dados.DS_GABARITO_MT, 40, 1),
    substring(tmp_dados.DS_GABARITO_MT, 17, 1),
    substring(tmp_dados.DS_GABARITO_MT, 09, 1),
    substring(tmp_dados.DS_GABARITO_MT, 39, 1),
    substring(tmp_dados.DS_GABARITO_MT, 35, 1),
    substring(tmp_dados.DS_GABARITO_MT, 08, 1),
    substring(tmp_dados.DS_GABARITO_MT, 22, 1),
    substring(tmp_dados.DS_GABARITO_MT, 12, 1),
    substring(tmp_dados.DS_GABARITO_MT, 34, 1),
    substring(tmp_dados.DS_GABARITO_MT, 23, 1),
    substring(tmp_dados.DS_GABARITO_MT, 27, 1),
    substring(tmp_dados.DS_GABARITO_MT, 26, 1),
    substring(tmp_dados.DS_GABARITO_MT, 02, 1),
    substring(tmp_dados.DS_GABARITO_MT, 13, 1),
    substring(tmp_dados.DS_GABARITO_MT, 32, 1),
    substring(tmp_dados.DS_GABARITO_MT, 03, 1))
from tmp_dados where tmp_dados.ID_PROVA_MT = 149 limit 1));

insert into debug values('All done.', curtime());
