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

We uploaded the example datasets in the following FTP platform. 
Please download the DNA and RNA testing dataset and put them in "ARGMap/example/WGS/" and "ARGMap/example/RNAseq/", respectively. 

**Example Datasets: http://bmbl.sdstate.edu/downloadFiles/example.zip

**Please make sure both of your input datasets are in fastq format!**

**Description of the testing datasets:

3-A. DNA whole-genome shotgun sequencing (paired-end) example dataset

Design: Illumina sequencing of human gut metagenome via random selection
Accession ID: SRX247394 
ID of example run: SRR769533
Data link: https://www.ncbi.nlm.nih.gov/sra/SRX247394%5Baccn%5D
Citation: [1]
Download Date: 2017/1/23
Other Information: 
ILLUMINA (Illumina HiSeq 2000) run: 15.4M spots, 3.1G bases, 2.3Gb downloads

3-B. RNA sequencing of transcriptome (paired-end) example dataset
Design: Illumina sequencing of human gut metagenome via random selection
Accession ID: SRX247334 
ID of example run: SRR769401	
Data link: https://www.ncbi.nlm.nih.gov/sra/SRX247334%5Baccn%5D
Citation: [1]
Download Date: 2017/1/23
Other Information: 
ILLUMINA (Illumina HiSeq 2000) runs: 12.5M spots, 2.5G bases, 2.1Gb downloads

4. Config File "pipeline_config.sh" Editing

  **Please edit the pathway in config file as its instruction!**
  
5. Execution of pipeline shell script

  Please access to your source directory and input "./drug_resistance_pipeline.sh" then it will source the config file and execute pipeline job. 

** The output of testing datasets:
FTP Link: http://bmbl.sdstate.edu/downloadFiles/output.zip

6. Results Interpretation
  
  In the _integrative_coverage file, first few lines look like 
```
gb|AY928180|0-495|ARO:3002837|lnuC	0	494	52	490	0.9919028	211	494	1.0000000	4.05769	4.02484

```

######Description of columns:
1. ID of antibiotic resistant gene
2. Start position of the gene (bed format)
3. End position of the gene (bed format)
4. (DNA)number of sequencing reads mapped to the gene
5. (DNA)number of mapped nucleotides of the gene
6. (DNA)fraction of the gene covered by sequencing reads
7. (RNA)number of sequencing reads mapped to the gene
8. (RNA)number of mapped nucleotides of the gene
9. (RNA)fraction of the gene covered by sequencing reads
10. (#RNA-read/Gene length)/(#DNA-read/Gene length)
11. (#RNA-read/RNA-coverage)/(#DNA-read/DNA-coverage)


