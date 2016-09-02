# ARGMap
Antibiotic Resistant Gene metagenomics and metatranscriptomics MAPping pipeline  
Profiling Antibiotic Resistant Gene Expression with metagenome and metatranscriptome data (for microbiome data from any habitats)

WGS and RNAseq mapping testing Tutorial

1. Installation of Bowtie2, Bedtools and Samtools 

  Installation of Bowtie2 2.2.1
  
  Please check: http://bowtie-bio.sourceforge.net/bowtie2/manual.shtml#obtaining-bowtie-2
  
  Installation of Bedtools 2.25.0

  Please check: http://bedtools.readthedocs.io/en/latest/content/installation.html

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
gb|AJ295238|0-1920|ARO:3000196|tet32	1284	1382	SL-HBV:H2W77ADXY160506:H2W77ADXY:2:1101:7660:79454/1	0	+	1284	1382	0,0,0	1	98,	0,	1	98	98	1.0000000
gb|M18896|0-1920|ARO:3000190|tetO	1271	1372	SL-HBV:H2W77ADXY160506:H2W77ADXY:2:1101:7660:79454/2	1	-	1271	1372	0,0,0	1	101,	0,	1	101	101	1.0000000
```


