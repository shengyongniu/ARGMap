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
  

  In the .coverage file, first few lines look like 
```
gb|A15097|382-1642|ARO:3000363|EreB 0 1259 0 0 0.0000000 0 0 0.0000000
gb|AB008454|153-1290|ARO:3002493|SRT-1 0 1136 0 0 0.0000000 0 0 0.0000000
gb|AB010417|0-741|ARO:3002194|IMP-3 0 740 0 0 0.0000000 0 0 0.0000000
gb|AB014481|0-735|ARO:3002825|ErmY 0 734 0 0 0.0000000 0 0 0.0000000
gb|AB015853|1330-4471|ARO:3003033|mexY 0 3141 0 0 0.0000000 0 0 0.0000000
gb|AB015853|145-1315|ARO:3003034|mexX 0 1170 0 0 0.0000000 0 0 0.0000000
gb|AB016934|6575-7376|ARO:3000423|FomA 0 801 0 0 0.0000000 0 0 0.0000000
gb|AB016934|7388-8381|ARO:3000449|FomB 0 993 0 0 0.0000000 0 0 0.0000000

```

######Description of columns:
  1. id of antibiotic resistant gene
  2. start position of the gene (bed format)
  3. end position of the gene (bed format)
  4. (WGS)number of sequencing reads mapped to the gene
  5. (WGS)number of nucleotides of the gene mapped by sequencing reads
  6. (WGS)fraction of the gene covered by sequencing reads
  7. (RNA)number of sequencing reads mapped to the gene
  8. (RNA)number of nucleotides of the gene mapped by sequencing reads
  9. (RNA)fraction of the gene covered by sequencing reads

