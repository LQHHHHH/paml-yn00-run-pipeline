
for i in `ls *.paml`;
do 
prefix=${i%%.cds_aln.paml}
infile=$i
outfile=$i".out"
kaksfile=$i".out.kaks"
awk 'NR==1{print $1,$2,"'''$infile'''"}NR==2{print $1,$2,"'''$outfile'''"}NR>2{print $0}' yn00.ctl2 > yn00.ctl; 
yn00;
#echo "gene_pairs omega(ka/ks)	ka	ks" | cat > $kaksfile;
echo -n "$prefix	" | cat >> $kaksfile;
awk 'NR==89{print $7,$8,$9,$10,$11,$12,$13}' $outfile >> $kaksfile;
done
cat *.kaks > group.kaks
sed -i '1i genepair\tka/ks\tka\ks' group.kaks
