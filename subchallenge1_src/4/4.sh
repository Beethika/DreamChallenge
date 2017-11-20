awk -F "\t" '{print $1+1"\t"$2+1"\t"$3}' ../data/subchallenge1/4_coexpr_anonym_v2.txt > 4modifiedcoexp.txt
Rscript wgcnacomputation.R
python printmodules.py > prefinal.txt
python coremoduleidentification.py prefinal.txt ../data/subchallenge1/4_coexpr_anonym_v2.txt > 4_coexpr_anonym_v2.txt
sed -i 's/\(.*\)\t/\1/' 4_coexpr_anonym_v2.txt
sed -i 's/ //g' 4_coexpr_anonym_v2.txt
