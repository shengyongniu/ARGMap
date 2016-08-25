#########################################################################
### THIS CONFIG SCRIPT WILL BE SOURCED IN drug_resistance_pipeline.sh ###
#########################################################################


########################################
### data and source code directories ###
########################################

# directory where source scripts are located
sourcedir=$PWD
# directory where CARD reference database is located
CARD_dir="${sourcedir}/CARD/"
CARD_fasta="${CARD_dir}/nucleotide_fasta_protein_homolog_model.fasta" 


##Please add hashtag in the front of "WGS_dir" if you don't run WGS pipeline 
WGS_dir="${sourcedir}/example/WGS"
WGS_First="WGS.end1.fq.gz"
WGS_Second="WGS.end2.fq.gz"
##Please add hashtag in the front of "RNAseq_dir" if you don't run RNAseq pipeline
RNAseq_dir="${sourcedir}/example/RNAseq"
RNAseq_First="RNAseq.end1.fq.gz"
RNAseq_Second="RNAseq.end2.fq.gz"

# directory where executable tool files are located
Bowtie2_dir="/broad/software/free/Linux/redhat_6_x86_64/pkgs/bowtie2_2.2.1/"
Bedtools_dir="/broad/software/free/Linux/redhat_6_x86_64/pkgs/bedtools_version-2.16.1/bin/"
Samtools_dir="/broad/software/free/Linux/redhat_6_x86_64/pkgs/samtools/samtools_1.3/bin/"



# output directory where all outputs will be stored
output_dir="${sourcedir}/output/"
WGS_outputName="test2.drugRes.WGS00001"
RNASeq_outputName="test2.drugRes.RNAseq00001"
###########
### EOF ###
###########

