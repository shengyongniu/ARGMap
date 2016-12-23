# ARGMap
Antibiotic Resistant Gene metagenomics and metatranscriptomics MAPping pipeline  
Profiling Antibiotic Resistant Gene Expression with metagenome and metatranscriptome data (for microbiome data from any habitats)

WGS and RNAseq mapping testing Tutorial

1. Installation of Bowtie2, Bedtools and Samtools 

  Installation of Bowtie2 2.2.1
  
  Please check: http://bowtie-bio.sourceforge.net/bowtie2/manual.shtml#obtaining-bowtie-2
  
  Installation of Bedtools 2.16.1

  Please check: https://launchpad.net/ubuntu/+source/bedtools/2.16.1-1

  Installation of Samtools 1.3.1

  Please check: http://www.htslib.org/download/
  

2. CARD Database (The Comprehensive Antibiotic Resistance Database)
  
  CARD v.1.1.0 reference database will be built up in "${sourcedir}/CARD/" by default


3.  WGS and RNAseq Input Testing Dataset (Paired-End)

  **Please make sure both of your input datasets are in fastq format!**
  
  -Our WGS and RNAseq testing dataset are orginally from NCBI SRA experimental data as following link: 
  
  WGS: https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?run=SRR769532
  
  RNAseq: https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?run=SRR769427
  
  -We have already transformed them into fastq format files and they only have mapped part of data for storage and time saving purpose.
  
  **WGS and RNAseq testing datasets are located in  "ARGMap/example/WGS/" and "ARGMap/example/RNAseq/" by default. **
  


4. Config File "pipeline_config.sh" Editing

  **Please edit the pathway in config file as its instruction!**
  
5. Execution of pipeline shell script

  Please access to your source directory and input "./drug_resistance_pipeline.sh" then it will source the config file and execute pipeline job. 

6. Results Interpretation
  

  In the _integrative_coverage file, first few lines look like 
```
gb|NC_023287|60996-61860|ARO:3002626|ANT(6)-Ia	0	863	23	507	0.5874855	20	186	0.2155272	0.869565	2.37027

```

######Description of columns:
1. id of antibiotic resistant gene
2. start position of the gene (bed format)
3. end position of the gene (bed format)
4. (WGS)number of sequencing reads mapped to the gene
5. (WGS)number of mapped nucleotides of the gene 
6. (WGS)fraction of the gene covered by sequencing reads
7. (RNA)number of sequencing reads mapped to the gene
8. (RNA)number of mapped nucleotides of the gene
9. (RNA)fraction of the gene covered by sequencing reads
10. (#RNA-read/Gene length)/(#DNA-read/Gene length)
11. (#RNA-read/RNA-coverage)/(#DNA-read/DNA-coverage)

