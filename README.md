# paml-yn00-run-pipeline

A personal pipeline to calculate Ka,Ks and Ka/Ks using PAML-yn00 with YN method

Here, we only use yn00 soft which incorporated in PAML package to calculate Ka,ks,Ka/Ks with Yang and Nielsen (YN) method. We also using [mafft](https://mafft.cbrc.jp/alignment/software/) and [ParaAT v2.0](https://bigd.big.ac.cn/tools/paraat) to perform a codon alignemt and transform to PAML format.

### Brief step:
1. Coding sequence, Protein sequence, and homologous group file, yn00_pre.ctl file
2. ParaAT will using mafft to perform a condon alignment
3. Get output PAML format file
4. Run run.yn00.sh.
5. Finally, you will get a group_kaks files which including Ka,Ks for your gene pairs.
> yn00_pre.ctl will feed to run.yn00.sh to generate yn00.ctl


| | |
| --- | --- |
| Authors | Qionghou Li ([qionghou](https://github.com/LQHHHHH)) |

**Anyone can use and revised this pipeline for personal use and welcome to cite our paper**

Comparative analysis of the P-type ATPase Gene Family in six Rosaceae species and an expression analysis in pear (Pyrus bretschneideri Rehd.) (under review)


## step 1
### Alignment
```
ParaAT.pl -h Fve.homo -n Fve.cds -a Fve.pep -p proc -o Fve -f paml -m mafft
```

## step 2
### running run.yn00.sh
```
sh run.yn00.sh
```
## Finish
### Check output file
```
FvH4_3g34570.1-FvH4_6g14760.1
omega(ka/ks)	ka	ks
0.0929 0.1501 +- 0.0086 1.6154 +- 0.1467
FvH4_4g28450.1-FvH4_5g12920.1
omega(ka/ks)	ka	ks
0.1055 0.1899 +- 0.0094 1.8002 +- 0.3746
FvH4_5g15700.1-FvH4_6g49360.1
omega(ka/ks)	ka	ks
0.0514 0.0793 +- 0.0071 1.5413 +- 0.1565
```
## Benchmarking
### Comparation of PAML and KaKs_calculator2.0
Results from KaKs_calculator2.0
```
Sequence        Method  Ka      Ks      Ka/Ks   P-Value(Fisher) Length  S-Sites N-Sites Fold-Sites(0:2:4)       Substitutions   S-Substitutions N-Substitutions Fold-S-Substitutio
FvH4_3g34570-FvH4_6g14760       YN      0.150056        1.61539 0.0928914       3.92388e-169    3147    771.16  2375.84 NA      834     511.258 322.742 NA      NA      0.50913 1.
Sequence        Method  Ka      Ks      Ka/Ks   P-Value(Fisher) Length  S-Sites N-Sites Fold-Sites(0:2:4)       Substitutions   S-Substitutions N-Substitutions Fold-S-Substitutio
FvH4_4g28450-FvH4_5g12920       YN      0.189919        1.80024 0.105496        5.58116e-133    3555    896.707 2658.29 NA      990     544.828 445.172 NA      NA      0.596104
Sequence        Method  Ka      Ks      Ka/Ks   P-Value(Fisher) Length  S-Sites N-Sites Fold-Sites(0:2:4)       Substitutions   S-Substitutions N-Substitutions Fold-S-Substitutio
FvH4_5g15700-FvH4_6g49360       YN      0.0792893       1.54126 0.0514444       1.44906e-165    2286    563.409 1722.59 NA      498     368.431 129.569 NA      NA      0.439608
```

Results from PAML-yn00
```
FvH4_3g34570.1-FvH4_6g14760.1
omega(ka/ks)	ka	ks
0.0929 0.1501 +- 0.0086 1.6154 +- 0.1467
FvH4_4g28450.1-FvH4_5g12920.1
omega(ka/ks)	ka	ks
0.1055 0.1899 +- 0.0094 1.8002 +- 0.3746
FvH4_5g15700.1-FvH4_6g49360.1
omega(ka/ks)	ka	ks
0.0514 0.0793 +- 0.0071 1.5413 +- 0.1565
```

There is no difference between two methods.


