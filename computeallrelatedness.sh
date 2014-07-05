#!/usr/bin/env bash

for rep in `ls -d 3*`
do
  cp allrelatedness.sh ${rep}/
  cd ${rep}
  ~/code/aevol4.3/src/post_treatments/aevol_misc_parsemutations -b 0 -e 4000 -g 500 -f 500
  ./allrelatedness.sh
  cd ..
done

