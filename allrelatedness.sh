#!/usr/bin/env bash

for file in `ls relatedness*`
do
  awk '{ sum += $1; n++ } END { if (n > 0) printf("%.6f\n", sum / n); }' $file >> Rsummary
  sed 's/0.000000/1.000000/g' ${file} > ${file}_1
  awk '{ sum += $1; n++ } END { if (n > 0) printf("%.6f\n", sum / n); }' ${file}_1 >> Rsummary_1
done

