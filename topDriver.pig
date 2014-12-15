file = LOAD '$INPUT' USING PigStorage('\t') AS (medallion:chararray, licence:chararray, pickup:chararray, dropoff:chararray, payment:chararray, fare:double, surchage:double, tax:double, tip:double, tolls:double, total:double, passenger:int, time:int, distance:double, plongi:double, plati:double, dlongi:double, dlati:double);

temp = GROUP file BY licence;

calculation = FOREACH temp GENERATE FLATTEN(file.licence), COUNT(file.licence) AS numbers, SUM(file.fare), AVG(file.fare), SUM(file.total), AVG(file.total), SUM(file.time), AVG(file.time), SUM(file.distance), AVG(file.distance);

uniq = DISTINCT calculation;

result = FILTER uniq BY numbers > 10000;

STORE result INTO '$OUTPUT';
