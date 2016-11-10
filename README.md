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
  
  In output file directory, you could find .sam, .bam and .coverage file for WGS and RNAseq files. In our .coverage file, the columns are .......... 

  In the .coverage file, first few lines look like 
```
gb|AJ295238|0-1920|ARO:3000196|tet32    0       1919    273     1918    1919    0.9994789
gb|EU434751|658-2578|ARO:3000194|tetW   0       1919    1063    1919    1919    1.0000000
gb|GQ342996|797-1793|ARO:3003097|CfxA6  0       996     1084    996     996     1.0000000
gb|M18896|0-1920|ARO:3000190|tetO       0       1919    814     1919    1919    1.0000000
gb|Z21523|0-1974|ARO:3000191|tetQ       0       1973    1372    1973    1973    1.0000000
```

######Description of columns:
  1. id of antibiotic resistant gene
  2. start position of the gene (bed format)
  3. end position of the gene (bed format)
  4. number of sequencing reads mapped to the gene
  5. number of nucleotides of the gene mapped by sequencing reads
  6. end position of the gene (bed format)
  7. fraction of the gene covered by sequencing reads

