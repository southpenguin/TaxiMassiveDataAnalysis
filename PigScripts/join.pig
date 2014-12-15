farefile = LOAD '$fare' USING PigStorage(',');
tripfile = LOAD '$trip' USING PigStorage(',');

faredata = STREAM farefile THROUGH `tail -n +2` AS (medallion1:chararray, licence1:chararray, id1:chararray, pickup:chararray, payment:chararray, fare:double, surchage:double, tax:double, tip:double, tolls:double, total:double);

tripdata = STREAM tripfile THROUGH `tail -n +2` AS (medallion2:chararray, licence2:chararray, id2:chararray, rate:int, store:chararray, pu:chararray, df:chararray, passenger:int, time:int, distance:double, a:double, b:double, c:double, d:double);

alldata = JOIN faredata BY (licence1, pickup) , tripdata BY (licence2, pu);

data = FOREACH alldata GENERATE medallion1, licence1, pickup, df, payment, fare, surchage, tax, tip, tolls, total, passenger, time, distance, a, b, c, d;

STORE data INTO '$OUTPUT';
