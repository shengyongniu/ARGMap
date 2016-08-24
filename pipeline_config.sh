#########################################################################
### THIS CONFIG SCRIPT WILL BE SOURCED IN drug_resistance_pipeline.sh ###
#########################################################################


########################################
### data and source code directories ###
########################################

# directory where source scripts are located
sourcedir=${PWD}
# directory where CARD reference database is located
CARD_dir="${sourcedir}/CARD/"
CARD_fasta="${CARD_dir}/nucleotide_fasta_protein_homolog_model.fasta" 


##Please add hashtag in the front of "WGS_dir" if you don't run WGS pipeline 
WGS_dir="/home/unix/wcchou/osUTI/data/dataOSUTI.WGS/merged4lanes/"
WGS_First="merged.metagenome.CRNd00001-1.1.fastq.gz"
WGS_Second="merged.metagenome.CRNd00001-1.2.fastq.gz"
##Please add hashtag in the front of "RNAseq_dir" if you don't run RNAseq pipeline
RNAseq_dir="/home/unix/wcchou/osUTI/data/dataOSUTI.RNAseq/v2/"
RNAseq_First="CRNr00001-1.bam.end1.fastq.gz"
RNAseq_Second="CRNr00001-1.bam.end2.fastq.gz"

# directory where executable tool files are located
Bowtie2_dir="/broad/software/free/Linux/redhat_6_x86_64/pkgs/bowtie2_2.2.1/"
Bedtools_dir="/broad/software/free/Linux/redhat_6_x86_64/pkgs/bedtools_2.17.0/bin/"
Samtools_dir="/broad/software/free/Linux/redhat_6_x86_64/pkgs/samtools/samtools_1.3/bin/"

# output directory where all outputs will be stored
output_dir="./output/"
mkdir ${output_dir}
WGS_outputName="test2.drugRes.CRNd00001"
RNASeq_outputName="test2.drugRes.CRNr00001"
###########
### EOF ###
###########

