file = LOAD '$INPUT' USING PigStorage(',') AS (licence:chararray, id:chararray, pickup:chararray, payment:chararray, fare:double, surchage:double, tax:double, tip:double, tolls:double, total:double);

temp = GROUP data BY fare;

dupresult = FOREACH temp GENERATE FLATTEN(data.fare), COUNT(data.fare);

result = DISTINCT dupresult;

STORE result INTO '$OUTPUT';

