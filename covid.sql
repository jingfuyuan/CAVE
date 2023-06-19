--check the labels for COVID-19 patients
select indi_pt, count(*)
from indi
where indi_pt like '%covid%' or 
    indi_pt like '%coronavirus%' or
    indi_pt like '%corona virus%' or
    indi_pt like '%SARS%'
group by indi_pt
order by count(*) desc;

/*
indication terms used for selecting covid-19 patients are
("COVID-19", 
"COVID-19 pneumonia", 
"Coronavirus infection",
"COVID-19 treatment", 
"SARS-CoV-2 test positive", 
"Suspected COVID-19", 
"Corona virus infection", 
"Coronavirus test positive")
*/

--select all rows from the indi table related to covid treatment
drop table if exists indi_covid2;
create table indi_covid2 as
select *
from indi
where indi_pt in 
("COVID-19", 
"COVID-19 pneumonia", 
"Coronavirus infection",
"COVID-19 treatment", 
"SARS-CoV-2 test positive", 
"Suspected COVID-19", 
"Corona virus infection", 
"Coronavirus test positive");

--sanity check
select * from indi_covid2;

--select all the drugs used for covid treatment
drop table if exists drug_covid2;
create table drug_covid2 as
select drug.*, indi_covid2.indi_pt
from drug
join indi_covid2 on
drug.primaryid = indi_covid2.primaryid and
drug.drug_seq = indi_covid2.indi_drug_seq;

--select all rows related to covid patients from the demo table
drop table if exists demo_covid2;
create table demo_covid2 as
select *
from demo
where primaryid in (
    select distinct primaryid
    from indi_covid2);
    
--select all rows related to covid patients from reac table
drop table if exists reac_covid2;
create table reac_covid2 as
select *
from reac
where primaryid in (
    select distinct primaryid
    from indi_covid2);
    
--select all rows related to covid patients from outc table
drop table if exists outc_covid2;
create table outc_covid2 as
select *
from outc
where primaryid in (
    select distinct primaryid
    from indi_covid2);
    

--check the outcome
select outc_cod, count(*)
from outc_covid2
group by outc_cod
order by count(*) desc;

/*
CODE      MEANING_TEXT 
----      ------------ 
DE        Death 
LT        Life-Threatening 
HO        Hospitalization - Initial or Prolonged  
DS        Disability 
CA        Congenital Anomaly 
RI        Required Intervention to Prevent Permanent   
     Impairment/Damage 
OT        Other Serious (Important Medical Event)
*/