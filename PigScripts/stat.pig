file = LOAD '$INPUT' USING PigStorage(',');

data = STREAM file THROUGH `tail -n +2` AS (medallion:chararray, licence:chararray, id:chararray, rate:int, store:chararray, pu:chararray, df:chararray, passenger:int, time:int, distance:double, a:double, b:double, c:double, d:double);

temp = GROUP data ALL;

result = FOREACH temp GENERATE SUM(data.time), AVG(data.time), MAX(data.time), MIN(data.time), SUM(data.passenger), AVG(data.passenger), MAX(data.passenger), MIN(data.passenger), SUM(data.distance), AVG(data.distance), MAX(data.distance), MIN(data.distance);

STORE result INTO '$OUTPUT';
