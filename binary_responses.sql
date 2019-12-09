/*
Creator: Douglas De Rizzo Meneghetti
Date: 18-7-2014

This script is supposed to be used after import.sql. It queries the tables created by the previous script and generates binary response files for all tests, using a random sample of 50000 examinees.
*/


insert into debug values('generating binary response files', curtime());

set @gabarito_ch  = (select GABARITO from provas where ID = 'CH');
set @gabarito_cn  = (select GABARITO from provas where ID = 'CN');
set @gabarito_lci = (select GABARITO from provas where ID = 'LCi');
set @gabarito_lce = (select GABARITO from provas where ID = 'LCe');
set @gabarito_mt  = (select GABARITO from provas where ID = 'MT');

insert into debug values('generating binary response file for CH...', curtime());

select concat(
    case when substring(RESPOSTAS_CH, 01, 1) = substring(@gabarito_ch , 01, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 02, 1) = substring(@gabarito_ch , 02, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 03, 1) = substring(@gabarito_ch , 03, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 04, 1) = substring(@gabarito_ch , 04, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 05, 1) = substring(@gabarito_ch , 05, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 06, 1) = substring(@gabarito_ch , 06, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 07, 1) = substring(@gabarito_ch , 07, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 08, 1) = substring(@gabarito_ch , 08, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 09, 1) = substring(@gabarito_ch , 09, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 10, 1) = substring(@gabarito_ch , 10, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 11, 1) = substring(@gabarito_ch , 11, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 12, 1) = substring(@gabarito_ch , 12, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 13, 1) = substring(@gabarito_ch , 13, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 14, 1) = substring(@gabarito_ch , 14, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 15, 1) = substring(@gabarito_ch , 15, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 16, 1) = substring(@gabarito_ch , 16, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 17, 1) = substring(@gabarito_ch , 17, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 18, 1) = substring(@gabarito_ch , 18, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 19, 1) = substring(@gabarito_ch , 19, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 20, 1) = substring(@gabarito_ch , 20, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 21, 1) = substring(@gabarito_ch , 21, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 22, 1) = substring(@gabarito_ch , 22, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 23, 1) = substring(@gabarito_ch , 23, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 24, 1) = substring(@gabarito_ch , 24, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 25, 1) = substring(@gabarito_ch , 25, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 26, 1) = substring(@gabarito_ch , 26, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 27, 1) = substring(@gabarito_ch , 27, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 28, 1) = substring(@gabarito_ch , 28, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 29, 1) = substring(@gabarito_ch , 29, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 30, 1) = substring(@gabarito_ch , 30, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 31, 1) = substring(@gabarito_ch , 31, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 32, 1) = substring(@gabarito_ch , 32, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 33, 1) = substring(@gabarito_ch , 33, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 34, 1) = substring(@gabarito_ch , 34, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 35, 1) = substring(@gabarito_ch , 35, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 36, 1) = substring(@gabarito_ch , 36, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 37, 1) = substring(@gabarito_ch , 37, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 38, 1) = substring(@gabarito_ch , 38, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 39, 1) = substring(@gabarito_ch , 39, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 40, 1) = substring(@gabarito_ch , 40, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 41, 1) = substring(@gabarito_ch , 41, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 42, 1) = substring(@gabarito_ch , 42, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 43, 1) = substring(@gabarito_ch , 43, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 44, 1) = substring(@gabarito_ch , 44, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CH, 45, 1) = substring(@gabarito_ch , 45, 1) then 1 else 0 end)
as RESPOSTAS from alunos where IN_PRESENCA_CH = 1
and RESPOSTAS not like '%*%'
and RESPOSTAS not like '%.%'
order by rand()
limit 50000
into outfile '/tmp/respostas_binarias_ch'
lines terminated by '\n';

insert into debug values('generating binary response file for CN...', curtime());

select concat(
    case when substring(RESPOSTAS_CN, 01, 1) = substring(@gabarito_cn , 01, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 02, 1) = substring(@gabarito_cn , 02, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 03, 1) = substring(@gabarito_cn , 03, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 04, 1) = substring(@gabarito_cn , 04, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 05, 1) = substring(@gabarito_cn , 05, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 06, 1) = substring(@gabarito_cn , 06, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 07, 1) = substring(@gabarito_cn , 07, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 08, 1) = substring(@gabarito_cn , 08, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 09, 1) = substring(@gabarito_cn , 09, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 10, 1) = substring(@gabarito_cn , 10, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 11, 1) = substring(@gabarito_cn , 11, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 12, 1) = substring(@gabarito_cn , 12, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 13, 1) = substring(@gabarito_cn , 13, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 14, 1) = substring(@gabarito_cn , 14, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 15, 1) = substring(@gabarito_cn , 15, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 16, 1) = substring(@gabarito_cn , 16, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 17, 1) = substring(@gabarito_cn , 17, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 18, 1) = substring(@gabarito_cn , 18, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 19, 1) = substring(@gabarito_cn , 19, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 20, 1) = substring(@gabarito_cn , 20, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 21, 1) = substring(@gabarito_cn , 21, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 22, 1) = substring(@gabarito_cn , 22, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 23, 1) = substring(@gabarito_cn , 23, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 24, 1) = substring(@gabarito_cn , 24, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 25, 1) = substring(@gabarito_cn , 25, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 26, 1) = substring(@gabarito_cn , 26, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 27, 1) = substring(@gabarito_cn , 27, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 28, 1) = substring(@gabarito_cn , 28, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 29, 1) = substring(@gabarito_cn , 29, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 30, 1) = substring(@gabarito_cn , 30, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 31, 1) = substring(@gabarito_cn , 31, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 32, 1) = substring(@gabarito_cn , 32, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 33, 1) = substring(@gabarito_cn , 33, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 34, 1) = substring(@gabarito_cn , 34, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 35, 1) = substring(@gabarito_cn , 35, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 36, 1) = substring(@gabarito_cn , 36, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 37, 1) = substring(@gabarito_cn , 37, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 38, 1) = substring(@gabarito_cn , 38, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 39, 1) = substring(@gabarito_cn , 39, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 40, 1) = substring(@gabarito_cn , 40, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 41, 1) = substring(@gabarito_cn , 41, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 42, 1) = substring(@gabarito_cn , 42, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 43, 1) = substring(@gabarito_cn , 43, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 44, 1) = substring(@gabarito_cn , 44, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_CN, 45, 1) = substring(@gabarito_cn , 45, 1) then 1 else 0 end)
as RESPOSTAS from alunos where IN_PRESENCA_CN = 1
and RESPOSTAS not like '%*%'
and RESPOSTAS not like '%.%'
order by rand()
limit 50000
into outfile '/tmp/respostas_binarias_cn'
lines terminated by '\n';

insert into debug values('generating binary response file for LC (english)...', curtime());

select concat(
    case when substring(RESPOSTAS_LC, 01, 1) = substring(@gabarito_lci, 01, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 02, 1) = substring(@gabarito_lci, 02, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 03, 1) = substring(@gabarito_lci, 03, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 04, 1) = substring(@gabarito_lci, 04, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 05, 1) = substring(@gabarito_lci, 05, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 06, 1) = substring(@gabarito_lci, 06, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 07, 1) = substring(@gabarito_lci, 07, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 08, 1) = substring(@gabarito_lci, 08, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 09, 1) = substring(@gabarito_lci, 09, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 10, 1) = substring(@gabarito_lci, 10, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 11, 1) = substring(@gabarito_lci, 11, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 12, 1) = substring(@gabarito_lci, 12, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 13, 1) = substring(@gabarito_lci, 13, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 14, 1) = substring(@gabarito_lci, 14, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 15, 1) = substring(@gabarito_lci, 15, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 16, 1) = substring(@gabarito_lci, 16, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 17, 1) = substring(@gabarito_lci, 17, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 18, 1) = substring(@gabarito_lci, 18, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 19, 1) = substring(@gabarito_lci, 19, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 20, 1) = substring(@gabarito_lci, 20, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 21, 1) = substring(@gabarito_lci, 21, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 22, 1) = substring(@gabarito_lci, 22, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 23, 1) = substring(@gabarito_lci, 23, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 24, 1) = substring(@gabarito_lci, 24, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 25, 1) = substring(@gabarito_lci, 25, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 26, 1) = substring(@gabarito_lci, 26, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 27, 1) = substring(@gabarito_lci, 27, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 28, 1) = substring(@gabarito_lci, 28, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 29, 1) = substring(@gabarito_lci, 29, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 30, 1) = substring(@gabarito_lci, 30, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 31, 1) = substring(@gabarito_lci, 31, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 32, 1) = substring(@gabarito_lci, 32, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 33, 1) = substring(@gabarito_lci, 33, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 34, 1) = substring(@gabarito_lci, 34, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 35, 1) = substring(@gabarito_lci, 35, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 36, 1) = substring(@gabarito_lci, 36, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 37, 1) = substring(@gabarito_lci, 37, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 38, 1) = substring(@gabarito_lci, 38, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 39, 1) = substring(@gabarito_lci, 39, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 40, 1) = substring(@gabarito_lci, 40, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 41, 1) = substring(@gabarito_lci, 41, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 42, 1) = substring(@gabarito_lci, 42, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 43, 1) = substring(@gabarito_lci, 43, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 44, 1) = substring(@gabarito_lci, 44, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 45, 1) = substring(@gabarito_lci, 45, 1) then 1 else 0 end)
from alunos where IN_PRESENCA_LC = 1 and TP_LINGUA = 0
and RESPOSTAS not like '%*%'
and RESPOSTAS not like '%.%'
order by rand()
limit 50000
into outfile '/tmp/respostas_binarias_lci'
lines terminated by '\n';

insert into debug values('generating binary response file for LC (spanish)...', curtime());

select concat(
    case when substring(RESPOSTAS_LC, 01, 1) = substring(@gabarito_lce, 01, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 02, 1) = substring(@gabarito_lce, 02, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 03, 1) = substring(@gabarito_lce, 03, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 04, 1) = substring(@gabarito_lce, 04, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 05, 1) = substring(@gabarito_lce, 05, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 06, 1) = substring(@gabarito_lce, 06, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 07, 1) = substring(@gabarito_lce, 07, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 08, 1) = substring(@gabarito_lce, 08, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 09, 1) = substring(@gabarito_lce, 09, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 10, 1) = substring(@gabarito_lce, 10, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 11, 1) = substring(@gabarito_lce, 11, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 12, 1) = substring(@gabarito_lce, 12, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 13, 1) = substring(@gabarito_lce, 13, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 14, 1) = substring(@gabarito_lce, 14, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 15, 1) = substring(@gabarito_lce, 15, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 16, 1) = substring(@gabarito_lce, 16, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 17, 1) = substring(@gabarito_lce, 17, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 18, 1) = substring(@gabarito_lce, 18, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 19, 1) = substring(@gabarito_lce, 19, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 20, 1) = substring(@gabarito_lce, 20, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 21, 1) = substring(@gabarito_lce, 21, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 22, 1) = substring(@gabarito_lce, 22, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 23, 1) = substring(@gabarito_lce, 23, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 24, 1) = substring(@gabarito_lce, 24, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 25, 1) = substring(@gabarito_lce, 25, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 26, 1) = substring(@gabarito_lce, 26, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 27, 1) = substring(@gabarito_lce, 27, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 28, 1) = substring(@gabarito_lce, 28, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 29, 1) = substring(@gabarito_lce, 29, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 30, 1) = substring(@gabarito_lce, 30, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 31, 1) = substring(@gabarito_lce, 31, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 32, 1) = substring(@gabarito_lce, 32, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 33, 1) = substring(@gabarito_lce, 33, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 34, 1) = substring(@gabarito_lce, 34, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 35, 1) = substring(@gabarito_lce, 35, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 36, 1) = substring(@gabarito_lce, 36, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 37, 1) = substring(@gabarito_lce, 37, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 38, 1) = substring(@gabarito_lce, 38, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 39, 1) = substring(@gabarito_lce, 39, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 40, 1) = substring(@gabarito_lce, 40, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 41, 1) = substring(@gabarito_lce, 41, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 42, 1) = substring(@gabarito_lce, 42, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 43, 1) = substring(@gabarito_lce, 43, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 44, 1) = substring(@gabarito_lce, 44, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 45, 1) = substring(@gabarito_lce, 45, 1) then 1 else 0 end)
from alunos where IN_PRESENCA_LC = 1 and TP_LINGUA = 1
and RESPOSTAS not like '%*%'
and RESPOSTAS not like '%.%'
order by rand()
limit 50000
into outfile '/tmp/respostas_binarias_lce'
lines terminated by '\n';

insert into debug values('generating binary response file for LC (all)...', curtime());

select concat(
    case when substring(RESPOSTAS_LC, 01, 1) = substring(@gabarito_lci, 01, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 02, 1) = substring(@gabarito_lci, 02, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 03, 1) = substring(@gabarito_lci, 03, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 04, 1) = substring(@gabarito_lci, 04, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 05, 1) = substring(@gabarito_lci, 05, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 06, 1) = substring(@gabarito_lci, 06, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 07, 1) = substring(@gabarito_lci, 07, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 08, 1) = substring(@gabarito_lci, 08, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 09, 1) = substring(@gabarito_lci, 09, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 10, 1) = substring(@gabarito_lci, 10, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 11, 1) = substring(@gabarito_lci, 11, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 12, 1) = substring(@gabarito_lci, 12, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 13, 1) = substring(@gabarito_lci, 13, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 14, 1) = substring(@gabarito_lci, 14, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 15, 1) = substring(@gabarito_lci, 15, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 16, 1) = substring(@gabarito_lci, 16, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 17, 1) = substring(@gabarito_lci, 17, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 18, 1) = substring(@gabarito_lci, 18, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 19, 1) = substring(@gabarito_lci, 19, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 20, 1) = substring(@gabarito_lci, 20, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 21, 1) = substring(@gabarito_lci, 21, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 22, 1) = substring(@gabarito_lci, 22, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 23, 1) = substring(@gabarito_lci, 23, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 24, 1) = substring(@gabarito_lci, 24, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 25, 1) = substring(@gabarito_lci, 25, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 26, 1) = substring(@gabarito_lci, 26, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 27, 1) = substring(@gabarito_lci, 27, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 28, 1) = substring(@gabarito_lci, 28, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 29, 1) = substring(@gabarito_lci, 29, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 30, 1) = substring(@gabarito_lci, 30, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 31, 1) = substring(@gabarito_lci, 31, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 32, 1) = substring(@gabarito_lci, 32, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 33, 1) = substring(@gabarito_lci, 33, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 34, 1) = substring(@gabarito_lci, 34, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 35, 1) = substring(@gabarito_lci, 35, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 36, 1) = substring(@gabarito_lci, 36, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 37, 1) = substring(@gabarito_lci, 37, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 38, 1) = substring(@gabarito_lci, 38, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 39, 1) = substring(@gabarito_lci, 39, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 40, 1) = substring(@gabarito_lci, 40, 1) then 1 else 0 end)
from alunos where IN_PRESENCA_LC = 1
and RESPOSTAS not like '%*%'
and RESPOSTAS not like '%.%'
order by rand()
limit 50000
into outfile '/tmp/respostas_binarias_lc'
lines terminated by '\n';

insert into debug values('generating binary response file for English LC items only...', curtime());

select concat(
    case when substring(RESPOSTAS_LC, 41, 1) = substring(@gabarito_lci, 41, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 42, 1) = substring(@gabarito_lci, 42, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 43, 1) = substring(@gabarito_lci, 43, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 44, 1) = substring(@gabarito_lci, 44, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 45, 1) = substring(@gabarito_lci, 45, 1) then 1 else 0 end)
from alunos where IN_PRESENCA_LC = 1 and TP_LINGUA = 0
and RESPOSTAS not like '%*%'
and RESPOSTAS not like '%.%'
order by rand()
limit 50000
into outfile '/tmp/respostas_binarias_ingles'
lines terminated by '\n';

insert into debug values('generating binary response file for Spanish LC items only...', curtime());

select concat(
    case when substring(RESPOSTAS_LC, 41, 1) = substring(@gabarito_lci, 41, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 42, 1) = substring(@gabarito_lci, 42, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 43, 1) = substring(@gabarito_lci, 43, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 44, 1) = substring(@gabarito_lci, 44, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_LC, 45, 1) = substring(@gabarito_lci, 45, 1) then 1 else 0 end)
from alunos where IN_PRESENCA_LC = 1 and TP_LINGUA = 1
and RESPOSTAS not like '%*%'
and RESPOSTAS not like '%.%'
order by rand()
limit 50000
into outfile '/tmp/respostas_binarias_espanhol'
lines terminated by '\n';

insert into debug values('generating binary response file for MT...', curtime());

select concat(
    case when substring(RESPOSTAS_MT, 01, 1) = substring(@gabarito_mt , 01, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 02, 1) = substring(@gabarito_mt , 02, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 03, 1) = substring(@gabarito_mt , 03, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 04, 1) = substring(@gabarito_mt , 04, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 05, 1) = substring(@gabarito_mt , 05, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 06, 1) = substring(@gabarito_mt , 06, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 07, 1) = substring(@gabarito_mt , 07, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 08, 1) = substring(@gabarito_mt , 08, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 09, 1) = substring(@gabarito_mt , 09, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 10, 1) = substring(@gabarito_mt , 10, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 11, 1) = substring(@gabarito_mt , 11, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 12, 1) = substring(@gabarito_mt , 12, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 13, 1) = substring(@gabarito_mt , 13, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 14, 1) = substring(@gabarito_mt , 14, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 15, 1) = substring(@gabarito_mt , 15, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 16, 1) = substring(@gabarito_mt , 16, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 17, 1) = substring(@gabarito_mt , 17, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 18, 1) = substring(@gabarito_mt , 18, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 19, 1) = substring(@gabarito_mt , 19, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 20, 1) = substring(@gabarito_mt , 20, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 21, 1) = substring(@gabarito_mt , 21, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 22, 1) = substring(@gabarito_mt , 22, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 23, 1) = substring(@gabarito_mt , 23, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 24, 1) = substring(@gabarito_mt , 24, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 25, 1) = substring(@gabarito_mt , 25, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 26, 1) = substring(@gabarito_mt , 26, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 27, 1) = substring(@gabarito_mt , 27, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 28, 1) = substring(@gabarito_mt , 28, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 29, 1) = substring(@gabarito_mt , 29, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 30, 1) = substring(@gabarito_mt , 30, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 31, 1) = substring(@gabarito_mt , 31, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 32, 1) = substring(@gabarito_mt , 32, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 33, 1) = substring(@gabarito_mt , 33, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 34, 1) = substring(@gabarito_mt , 34, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 35, 1) = substring(@gabarito_mt , 35, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 36, 1) = substring(@gabarito_mt , 36, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 37, 1) = substring(@gabarito_mt , 37, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 38, 1) = substring(@gabarito_mt , 38, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 39, 1) = substring(@gabarito_mt , 39, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 40, 1) = substring(@gabarito_mt , 40, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 41, 1) = substring(@gabarito_mt , 41, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 42, 1) = substring(@gabarito_mt , 42, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 43, 1) = substring(@gabarito_mt , 43, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 44, 1) = substring(@gabarito_mt , 44, 1) then 1 else 0 end, ',',
    case when substring(RESPOSTAS_MT, 45, 1) = substring(@gabarito_mt , 45, 1) then 1 else 0 end)
from alunos where IN_PRESENCA_MT = 1
and RESPOSTAS not like '%*%'
and RESPOSTAS not like '%.%'
order by rand()
limit 50000
into outfile '/tmp/respostas_binarias_mt'
lines terminated by '\n';

insert into debug values('All done.', curtime());