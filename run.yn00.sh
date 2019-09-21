#!/bin/bash
## Author: Qionghou Li liqionghou1996@gmail.com

for i in `ls *.paml`;
do 
prefix=${i%%.cds_aln.paml}
infile=$i
outfile=$i".out"
kaksfile=$i".out.kaks"
awk 'NR==1{print $1,$2,"'''$infile'''"}NR==2{print $1,$2,"'''$outfile'''"}NR>2{print $0}' yn00_pre.ctl > yn00.ctl; 
yn00;
echo "$prefix" | cat > $kaksfile;
echo "omega(ka/ks)	ka	ks" | cat >> $kaksfile;
awk 'NR==89{print $7,$8,$9,$10,$11,$12,$13}' $outfile >> $kaksfile;
done
cat *.kaks > group.kaks
