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
if [  "${sourcedir}" ];
then echo "sourcedir is in" ${sourcedir};
else echo "sourcedir doesn't exist." && exit 1 
fi

# directory where input data is located

CARD_dir="${CARD_dir}"
if [  "${CARD_dir}" ];
then echo "CARD_dir is in" ${CARD_dir};
else echo "CARD_dir doesn't exist." && exit 1 
fi

CARD_fasta="${CARD_fasta}"
if [  "${CARD_fasta}" ];
then echo "CARD_fasta  is in" ${CARD_fasta};
else echo "CARD_fasta doesn't exist." && exit 1 
fi



WGS_dir="${WGS_dir}"
if [  "${WGS_dir}" ];
then echo "WGS_dir  is in" ${WGS_dir};
else echo "WGS_dir doesn't exist." && exit 1
fi


RNAseq_dir="${RNAseq_dir}"
if [  "${RNAseq_dir}" ];
then echo "RNAseq_dir  is in" ${RNAseq_dir};
else echo "RNAseq_dir doesn't exist." && exit 1 
fi


# directory where executable tool files are located
Bowtie2_dir="${Bowtie2_dir}"
if [  "${Bowtie2_dir}" ];
then echo "Bowtie2_dir  is in" ${Bowtie2_dir};
else echo "Bowtie2_dir doesn't exist." && exit 1 
fi

Bedtools_dir="${Bedtools_dir}"
if [  "${Bedtools_dir}" ];
then echo "Bedtools_dir  is in" ${Bedtools_dir};
else echo "Bedtools_dir doesn't exist." && exit 1 
fi

Samtools_dir="${Samtools_dir}"
if [  "${Samtools_dir}" ];
then echo "Samtools_dir  is in" ${Samtools_dir};
else echo "Samtools_dir doesn't exist." && exit 1 
fi


# output directory where all outputs will be stored
output_dir="${output_dir}"
if [  "${output_dir}" ];
then echo "output_dir  is in" ${output_dir};
else echo "output_dir doesn't exist." && exit 1 
fi

WGS_outputName="${WGS_outputName}"
RNA_outputName="${RNASeq_outputName}"


##############################
### START RUNNING PIPELINE ###
##############################


##1. Build up reference database from CARD v1.1.0 for drug resistant genes mapping

echo "Build up CARD database"
cd ${sourcedir}
mkdir CARD
mkdir output
cd CARD
curl -O https://card.mcmaster.ca/download/0/broadstreet-v1.1.0.tar.gz
tar -xvf broadstreet-v1.1.0.tar.gz
mv nucleotide_fasta\[protein\ homolog\ model\].fasta  nucleotide_fasta_protein_homolog_model.fasta


##Build Bowtie index from a set of DNA sequence

echo "build Bowtie index from a set of DNA sequence"

${Bowtie2_dir}/bowtie2-build ${CARD_fasta}  ${CARD_dir}/nucleotide_fasta.ProteinHomologModel 


##2. Mapping of Metagenome Data

if [  -d "${WGS_dir}"  ];
 
then


 echo "####Mapping of Metagenome Data####"

 echo "Mapping of Homolog Model Data"
 
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

