file = LOAD '$INPUT' USING PigStorage('\t') AS (medallion:chararray, licence:chararray, pickup:chararray, dropoff:chararray, payment:chararray, fare:double, surchage:double, tax:double, tip:double, tolls:double, total:double, passenger:int, time:int, distance:double, plongi:double, plati:double, dlongi:double, dlati:double);

temp = GROUP file BY licence;

calculation = FOREACH temp GENERATE FLATTEN(file.licence), COUNT(file.licence) AS numbers, SUM(file.fare), AVG(file.fare), SUM(file.total), AVG(file.total), SUM(file.time), AVG(file.time), SUM(file.distance), AVG(file.distance);

uniq = DISTINCT calculation;

result1 = FILTER uniq BY numbers <= 1000;

result2 = FILTER uniq BY numbers > 1000 AND numbers <= 2000;

result3 = FILTER uniq BY numbers > 2000 AND numbers <= 4000;

result4 = FILTER uniq BY numbers > 4000 AND numbers <= 6000;

result5 = FILTER uniq BY numbers > 6000 AND numbers <= 8000;

result6 = FILTER uniq BY numbers > 8000 AND numbers <= 10000;

STORE uniq INTO '$OUT1';

STORE result1 INTO '$OUT2';

STORE result2 INTO '$OUT3';

STORE result3 INTO '$OUT4';

STORE result4 INTO '$OUT5';

STORE result5 INTO '$OUT6';

STORE result6 INTO '$OUT7';
