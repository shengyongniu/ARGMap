#########################################################################
### THIS CONFIG SCRIPT WILL BE SOURCED IN drug_resistance_pipeline.sh ###
#########################################################################


########################################
### data and source code directories ###
########################################

# directory where source scripts are located
sourcedir="/g/bork/zeller/for_simon/review/ARGMap"
# directory where CARD reference database is located
CARD_dir="${sourcedir}/CARD/"
CARD_fasta="${CARD_dir}/nucleotide_fasta_protein_homolog_model.fasta" 


##Please add hashtag in the front of "WGS_dir" if you don't run WGS pipeline 
WGS_dir="/g/bork/zeller/for_simon/review/ARGMap/example/WGS"
WGS_First="WGS.end1.fq.gz"
WGS_Second="WGS.end2.fq.gz"
##Please add hashtag in the front of "RNAseq_dir" if you don't run RNAseq pipeline
RNAseq_dir="/g/bork/zeller/for_simon/review/ARGMap/example/RNAseq"
RNAseq_First="RNAseq.end1.fq.gz"
RNAseq_Second="RNAseq.end2.fq.gz"

# directory where executable tool files are located
Bowtie2_dir="/g/bork/zeller/for_simon/review/bowtie2-2.2.1"
Bedtools_dir="/g/bork/zeller/for_simon/review/bedtools/bedtools2/bin"
Samtools_dir="/g/bork/zeller/for_simon/review/samtools-1.3.1"

# output directory where all outputs will be stored
output_dir="${sourcedir}/output/"
WGS_outputName="test2.drugRes.CRNd00001"
RNASeq_outputName="test2.drugRes.CRNr00001"
###########
### EOF ###
###########

