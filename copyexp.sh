#!/usr/bin/env bash
# Arguments: input, output, generation

mkdir -p $2
mkdir $2/environment $2/exp_setup $2/output_profile $2/populations $2/spatial_structure $2/stats

cp $1/exp_setup/exp_setup_const.ae $2/exp_setup/exp_setup_const.ae
cp $1/exp_setup/exp_setup_const.in $2/exp_setup/exp_setup_const.in
cp $1/output_profile/output_profile.ae $2/output_profile/output_profile.ae
cp $1/output_profile/output_profile.in $2/output_profile/output_profile.in

for i in $(ls $1/environment); do
  nb=$(basename $i |cut -d '_' -f 2 |cut -d '.' -f 1)
  if [ $nb -le $3 ]; then
    cp -r $1/environment/env_$nb.ae $2/environment/env_$nb.ae
    cp -r $1/exp_setup/exp_setup_$nb.ae $2/exp_setup/exp_setup_$nb.ae
    cp -r $1/populations/pop_$nb.ae $2/populations/pop_$nb.ae
    cp -r $1/spatial_structure/sp_struct_$nb.ae $2/spatial_structure/sp_struct_$nb.ae
  fi
done

for st in $(ls $1/stats); do
  awk '$1<='$3' || $1=="#"' $1/stats/$st > $2/stats/$st
done

