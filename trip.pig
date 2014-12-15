
A = load 'test/trip.csv';
B = group A all;
C = foreach B generate COUNT(A);
store C into 'test/t';
