#########################################################################
### THIS CONFIG SCRIPT WILL BE SOURCED IN drug_resistance_pipeline.sh ###
#########################################################################


########################################
### data and source code directories ###
########################################

# directory where source scripts are located
#Please edit source directory pathway
sourcedir="/g/bork/zeller/for_simon/pipeline_test"
# directory where CARD reference database is located
# Do not change the CARD pathway
CARD_dir="${sourcedir}/CARD/"
CARD_fasta="${CARD_dir}/nucleotide_fasta_protein_homolog_model.fasta" 


##Please add hashtag in the front of "WGS_dir" if you don't run WGS pipeline 
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
WGS_outputName="test2.drugRes.CRNd00001"
RNASeq_outputName="test2.drugRes.CRNr00001"
###########
### EOF ###
###########

