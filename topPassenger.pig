file = LOAD '$INPUT' USING PigStorage(',');

data = STREAM file THROUGH `tail -n +2` AS (medallion:chararray, licence:chararray, id:chararray, rate:int, store:chararray, pu:chararray, df:chararray, passenger:int, time:int, distance:double, a:double, b:double, c:double, d:double);

temp = GROUP data ALL;

result = FOREACH temp {
	psDesc = ORDER data BY passenger DESC;
	top = LIMIT psDesc 100;
	GENERATE FLATTEN(top);
};

STORE result INTO '$OUTPUT';

