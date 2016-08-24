#!/bin/bash

# written by Sheng-Yong Niu, August 2016 
version="0.1.0"

### Import config
if [ "$#" -gt 0 ]
then
    echo "Should not input redundant arguments"
    exit
else
    echo 'Reading config from pipeline_config.sh'
    source pipeline_config.sh
fi

### Set Directories###

# directory where source scripts are located
sourcedir="${sourcedir}"
echo "Source Directory: ${sourcedir}"
# directory where input data is located

CARD_dir="${CARD_dir}"
echo "CARD Directory: ${CARD_dir}"
CARD_fasta="${CARD_fasta}"



WGS_dir="${WGS_dir}"
echo "WGS Directory: ${WGS_dir}"


RNAseq_dir="${RNAseq_dir}"
echo "RNAseq Directory: ${RNAseq_dir}"

# directory where executable tool files are located
Bowtie2_dir="${Bowtie2_dir}"
echo "Bowtie2 Directory: ${Bowtie2_dir}"
Bedtools_dir="${Bedtools_dir}"
echo "Bedtools Directory: ${Bedtools_dir}"
Samtools_dir="${Samtools_dir}"
echo "Samtools Directory: ${Samtools_dir}"

# output directory where all outputs will be stored
output_dir="${output_dir}"
echo "Output Directory: ${output_dir}"
WGS_outputName="${WGS_outputName}"
RNA_outputName="${RNASeq_outputName}"



##############################
### START RUNNING PIPELINE ###
##############################


##1. Build up reference database from CARD v1.1.0 for drug resistant genes mapping

echo "Build up CARD database"
cd ${sourcedir}
mkdir CARD
cd CARD
curl -O https://card.mcmaster.ca/download/0/broadstreet-v1.1.0.tar.gz
tar -xvf broadstreet-v1.1.0.tar.gz
mv nucleotide_fasta\[protein\ homolog\ model\].fasta  nucleotide_fasta_protein_homolog_model.fasta


##Build Bowtie index from a set of DNA sequence

echo "build Bowtie index from a set of DNA sequence"
cd ${Bowtie2_dir}

./bowtie2-build ${CARD_fasta}  ${CARD_dir}/nucleotide_fasta.ProteinHomologModel 


##2. Mapping of Metagenome Data

if [  -d "${WGS_dir}"  ];
 
then


 echo "####Mapping of Metagenome Data####"

 echo "Mapping of Homolog Model Data"
# cd ${Bowtie2_dir}
 ${Bowtie2_dir}/bowtie2 -x  ${CARD_dir}/nucleotide_fasta.ProteinHomologModel  -1 ${WGS_dir}/${WGS_First} -2 ${WGS_dir}/${WGS_Second}  -S ${output_dir}/${WGS_outputName}.sam
 
 echo "Converting mapping results from sam format to bam format..." 
 cd ${Samtools_dir}
 ./samtools view -bS ${output_dir}/${WGS_outputName}.sam > ${output_dir}/${WGS_outputName}.bam


 echo "Getting bed file for gene sequences..."
 
 awk '/^>/ {if (seqlen){print "0\t"seqlen-1}; gsub(/^>/,"",$1);printf("%s\t",$1) ;seqlen=0;next; } { seqlen += length($0)}END{print "0\t"seqlen-1}' ${CARD_fasta}  > ${CARD_fasta}.bed

 echo "Using bedtools coverage to get read count and coverage over each gene..."
 cd ${Bedtools_dir}
 ./bedtools coverage -abam  ${output_dir}/${WGS_outputName}.bam -b   ${CARD_fasta}.bed > ${output_dir}/${WGS_outputName}.coverage
 
 echo "It's the end of WGS Mapping Session :) "

else

echo "Cannot read proper WGS_directory, skip to read metatranscriptome Data."

fi



##3. Mapping of Metatranscriptome Data

if [  -d "${RNAseq_dir}"  ];

then


echo "####Mapping of Metatranscriptome Data####"

echo "Use Bowtie2 to map RNAseq data with Hololog Model Data"
#cd ${Bowtie2_dir}
${Bowtie2_dir}/bowtie2 -x  ${CARD_dir}/nucleotide_fasta.ProteinHomologModel  -1 ${RNAseq_dir}/${RNAseq_First} -2 ${RNAseq_dir}/${RNAseq_Second}  -S ${output_dir}/${RNA_outputName}.sam

echo "Converting mapping results from sam format to bam format..."
cd ${Samtools_dir}
./samtools view -bS ${output_dir}/${RNA_outputName}.sam > ${output_dir}/${RNA_outputName}.bam


echo "Getting bed file for gene sequences..."

awk '/^>/ {if (seqlen){print "0\t"seqlen-1}; gsub(/^>/,"",$1);printf("%s\t",$1) ;seqlen=0;next; } { seqlen += length($0)}END{print "0\t"seqlen-1}' ${CARD_fasta} > ${CARD_fasta}.bed

echo "Using bedtools coverage to get read count and coverage over each gene..."

cd ${Bedtools_dir}
./bedtools coverage -abam ${output_dir}/${RNA_outputName}.bam -b  ${CARD_fasta}.bed > ${output_dir}/${RNA_outputName}.coverage

echo "It's the end of RNASeq Mapping Session. :) "
else 

echo "Cannot Read Metatranscriptome Data, skip this session."

fi

