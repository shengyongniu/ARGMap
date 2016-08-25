# ARGMap
Antibiotic Resistant Gene metagenomics and metatranscriptomics MAPping pipeline  
Profiling Antibiotic Resistant Gene Expression with metagenome and metatranscriptome data (for any habitats)

##WGS and RNAseq mapping testing Tutorial

1. Installation of Bowtie2, Bedtools and Samtools 

  Installation of Bowtie2 2.2.1
  
  Please check: http://bowtie-bio.sourceforge.net/bowtie2/manual.shtml#obtaining-bowtie-2
  
  Installation of Bedtools 2.25.0

  Please check: http://bedtools.readthedocs.io/en/latest/content/installation.html

  Installation of Samtools 1.3.1

  Please check: http://www.htslib.org/download/

2.  WGS and RNAseq Input Testing Dataset (Paired-End)

  **Please make sure both of your input datasets are in fastq format!**
  
  -Our WGS and RNAseq testing dataset are orginally from NCBI SRA experimental data as following link: 
  
  WGS: https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?run=SRR769532
  
  RNAseq: https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?run=SRR769427
  
  -We have already transformed them into fastq format files and they only have mapped part of data for storage and time saving purpose.
  
  -WGS and RNAseq testing datasets are located in  "ARGMap/example/WGS/" and "ARGMap/example/RNAseq/" by default. 
  
 
3. Config File "pipeline_config.sh" Editing

  **Please edit the pathway in config file!**
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




- Execution of pipeline shell script

- Results Interpretation
- 

2. 
- Build up CARD v.1.1.0 reference database
- default download from https://card.mcmaster.ca/download/0/broadstreet-v1.1.0.tar.gz
- Get input data ready
