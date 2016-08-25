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
  
 
3. Config file editing

- Execution of pipeline shell script

- Results Interpretation
- 

2. 
- Build up CARD v.1.1.0 reference database
- default download from https://card.mcmaster.ca/download/0/broadstreet-v1.1.0.tar.gz
- Get input data ready
