#########################################################################
### THIS CONFIG SCRIPT WILL BE SOURCED IN drug_resistance_pipeline.sh ###
#########################################################################


########################################
### data and source code directories ###
########################################

# directory where source scripts are located
<<<<<<< HEAD
sourcedir=${PWD}
=======
#Please edit source directory pathway
sourcedir="/g/bork/zeller/for_simon/pipeline_test"
>>>>>>> 9151c04f708d6280f7102fdac755de529e053c6c
# directory where CARD reference database is located
# Do not change the CARD pathway
CARD_dir="${sourcedir}/CARD/"
CARD_fasta="${CARD_dir}/nucleotide_fasta_protein_homolog_model.fasta" 


##Please add hashtag in the front of "WGS_dir" if you don't run WGS pipeline 
<<<<<<< HEAD
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
=======
#Please edit the WGS directory pathway and files name
WGS_dir="/g/bork/zeller/for_simon/review/WGS"
WGS_First="merged.metagenome.CRNd00001-1.1.fastq"
WGS_Second="merged.metagenome.CRNd00001-1.2.fastq"
##Please add hashtag in the front of "RNAseq_dir" if you don't run RNAseq pipeline
#Please edit the RNAseq directory pathway and files name
RNAseq_dir="/g/bork/zeller/for_simon/review/RNAseq"
RNAseq_First="CRNr00001-1.bam.end1.fastq"
RNAseq_Second="CRNr00001-1.bam.end2.fastq"

# directory where executable tool files are located
#Please edit the tools directory pathway
Bowtie2_dir="/g/bork/zeller/for_simon/review/bowtie2-2.2.1"
Bedtools_dir="/g/bork/zeller/for_simon/review/bedtools/bedtools2/bin"
Samtools_dir="/g/bork/zeller/for_simon/review/samtools-1.3.1"

# output directory where all outputs will be stored
#Please edit the output directory pathway and output files name
output_dir="/g/bork/zeller/for_simon/pipeline_test/output/"
>>>>>>> 9151c04f708d6280f7102fdac755de529e053c6c
WGS_outputName="test2.drugRes.CRNd00001"
RNASeq_outputName="test2.drugRes.CRNr00001"
###########
### EOF ###
###########

