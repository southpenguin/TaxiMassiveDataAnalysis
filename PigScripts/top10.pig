driverfile = LOAD '$IN1' AS (licence1:chararray);
tripfile = LOAD '$IN2' USING PigStorage(',');

tripdata = STREAM tripfile THROUGH `tail -n +2` AS (medallion2:chararray, licence2:chararray, id2:chararray, rate:int, store:chararray, pu:chararray, df:chararray, passenger:int, time:int, distance:double, a:double, b:double, c:double, d:double);

alldata = JOIN driverfile BY (licence1) , tripdata BY (licence2);

data = FOREACH alldata GENERATE licence1, pu, df, passenger, time, distance, a, b, c, d;

STORE data INTO '$OUTPUT’;
