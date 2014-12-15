file = LOAD '$INPUT' USING PigStorage(',');

data = STREAM file THROUGH `tail -n +1` AS (medallion:chararray, licence:chararray, id:chararray, pickup:chararray, payment:chararray, fare:double, surchage:double, tax:double, tip:double, tolls:double, total:double);

temp = GROUP data ALL;

result = FOREACH temp GENERATE 
SUM(data.fare), AVG(data.fare), MAX(data.fare), MIN(data.fare), 
SUM(data.surchage), AVG(data.surchage), MAX(data.surchage), MIN(data.surchage), 
SUM(data.tax), AVG(data.tax), MAX(data.tax), MIN(data.tax), 
SUM(data.tip), AVG(data.tip), MAX(data.tip), MIN(data.tip), 
SUM(data.tolls), AVG(data.tolls), MAX(data.tolls), MIN(data.tolls), 
SUM(data.total), AVG(data.total), MAX(data.total), MIN(data.total);

STORE result INTO '$OUTPUT';
