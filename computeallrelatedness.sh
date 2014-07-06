#!/usr/bin/env bash

cd ${1}

for rep in `ls -d 3*`
do
  cd ${rep}
  ~/code/aevol4.3/src/post_treatments/aevol_misc_parsemutations -b 0 -e 4000 -g 500 -f 500
  for file in `ls relatedness*`
  do
    awk '{ sum += $1; n++ } END { if (n > 0) printf("%.6f\n", sum / n); }' $file >> Rsummary
    sed 's/0.000000/1.000000/g' ${file} > ${file}_1
    awk '{ sum += $1; n++ } END { if (n > 0) printf("%.6f\n", sum / n); }' ${file}_1 >> Rsummary_1
  done
  cd ..
done

