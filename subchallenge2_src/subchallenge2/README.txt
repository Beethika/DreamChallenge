===========Normalized network===============================

We have created two normalized networks 3_norm.txt and 6_norm.txt using min-max normalization.
==================TO REPRODUCE FINAL SUBMISSION==============
python__init_v2.py 1.txt 2.txt 3_norm.txt 4.txt 5.txt 6_norm.txt 0.1 > multimod0.1.txt
(python coremoduleidentification.py multimod0.1.txt integratedNetwork.txt)>outputnew.txt
sed -i 's/\(.*\)\t/\1/' outputnew.txt
sed -i 's/ //g' outputnew.txt
python signallinginandcoexp.py outputnew.txt 3_signal_anonym_aligned_directed_v3.txt 4_coexpr_anonym_aligned_v2.txt > sigout.txt
(nawk '{FS="\t"} NF==1 {acc[$1]=1} NF>1 {if( ( $1 in acc ) ) {print $0} }' sigout.txt outputnew.txt)>communitiesset1.txt
matlab -nodesktop -nosplash -r "CreatingRemainingNetwork;quit;"
python __init_v2.py 1.tmp 2.tmp 3.tmp 4.tmp 5.tmp 6.tmp 0.1 > Sc2_pruned_0.1.out
(python coremoduleidentification.py Sc2_pruned_0.1.out integratedNetwork.txt)>outputafterremoving.txt
sed -i 's/\(.*\)\t/\1/' outputafterremoving.txt
sed -i 's/ //g' outputafterremoving.txt
python signallinginandcoexp.py outputafterremoving.txt 3_signal_anonym_aligned_directed_v3.txt 4_coexpr_anonym_aligned_v2.txt > sigoutnew.txt
python signallinginandppistringent.py outputafterremoving.txt 3_signal_anonym_aligned_directed_v3.txt 1_ppi_anonym_aligned_v2.txt > ppiout.txt
cat sigoutnew.txt ppiout.txt|sort -u > sigppiout.txt
(nawk '{FS="\t"} NF==1 {acc[$1]=1} NF>1 {if( ( $1 in acc ) ) {print $0} }' sigppiout.txt outputafterremoving.txt)>communitiesset2.txt
cat communitiesset1.txt communitiesset2.txt > set12.txt
(python printcommunities.py set12.txt)>prefinal.txt
sed -i 's/\(.*\)\t/\1/' prefinal.txt
sed -i 's/ //g' prefinal.txt
==========confidence scoring====================
(python signallinginandcoexpstringent.py prefinal.txt 3_signal_anonym_aligned_directed_v3.txt 4_coexpr_anonym_aligned_v2.txt)>confidence1.txt
(python signallinginandcoexpstringentnew.py prefinal.txt 3_signal_anonym_aligned_directed_v3.txt 4_coexpr_anonym_aligned_v2.txt)>confidence0.9.txt
(python signallinginandcoexp.py prefinal.txt 3_signal_anonym_aligned_directed_v3.txt 4_coexpr_anonym_aligned_v2.txt)>confidence0.8.txt
(python signallinginandppistringent.py prefinal.txt 3_signal_anonym_aligned_directed_v3.txt 1_ppi_anonym_aligned_v2.txt)>confidence0.7.txt
1:cat confidence1.txt > 1final.txt
0.9:python confidence0.9.py > 0.9final.txt
0.8:python confidence0.8.py > 0.8final.txt
0.7:python confidence0.7.py > 0.7final.txt
==================================================
(nawk '{FS="\t"} NF==1 {acc[$1]=1} NF>1 {if( ( $1 in acc ) ) {print $0} }' 0.7final.txt prefinal.txt)>0.7full.txt
(nawk '{FS="\t"} NF==1 {acc[$1]=1} NF>1 {if( ( $1 in acc ) ) {print $0} }' 0.8final.txt prefinal.txt)>0.8full.txt
(nawk '{FS="\t"} NF==1 {acc[$1]=1} NF>1 {if( ( $1 in acc ) ) {print $0} }' 0.9final.txt prefinal.txt)>0.9full.txt
(nawk '{FS="\t"} NF==1 {acc[$1]=1} NF>1 {if( ( $1 in acc ) ) {print $0} }' 1final.txt prefinal.txt)>1full.txt
====================================================
(cat 0.7full.txt| awk -F "\t" -v OFS="\t" -v INDEX=$index '{$INDEX=0.7; print }')>0.7finalised.txt
(cat 0.8full.txt| awk -F "\t" -v OFS="\t" -v INDEX=$index '{$INDEX=0.8; print }')>0.8finalised.txt
(cat 0.9full.txt| awk -F "\t" -v OFS="\t" -v INDEX=$index '{$INDEX=0.9; print }')>0.9finalised.txt
(cat 1full.txt| awk -F "\t" -v OFS="\t" -v INDEX=$index '{$INDEX=1; print }')>1finalised.txt
======================================================
(cat 0.7finalised.txt 0.8finalised.txt 0.9finalised.txt 1finalised.txt |sort -r -k '1n')>finalsubmission.txt
=======================================================


