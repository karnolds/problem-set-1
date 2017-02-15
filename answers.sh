#! /usr/bin/env bash 

datasets='/Users/katiearnolds/data-sets'
# Which state has the lowest murder rate?

states="$datasets/misc/states.tab.gz"

answer_1=$(gzcat $states \
    | grep -v '^#' \
    | cut -f1,6 \
    | sort -k2n \
    | head -n1 \
    | cut -f1 \
    | sed 's/"//g') 

echo "answer-1: $answer_1"

#how many sequence records are in the 'sample.fa' file?

sample="$datasets/fasta/sample.fa"

answer_2=$(grep '^>' $sample | wc -l)

echo "answer-2: $answer_2"

# How many unique CpG IDs are in 'cpg.bed.gz'?

cpg="$datasets/bed/cpg.bed.gz"

answer_3=$(gzcat $cpg\
| cut -f4\
| uniq -c \
| wc -l)

echo "answer-3: $answer_3"

# How many sequence records are in the SP1.fq file?

SP1="$datasets/fastq/SP1.fq"

answer_4=$(grep '^@cluster' $SP1\
 |wc -l)

 echo "answer-4: $answer_4"

 #How many words are on lines containing the word "bloody" in 
# 'hamlet.txt'?

hamlet="$datasets/misc/hamlet.txt"

answer_5=$(grep -i 'bloody' $hamlet\
 | wc -w)

 echo "answer-5: $answer_5"

# What is the length of the sequence of the first record of 'sample.fa'?

sample="$datasets/fasta/sample.fa"

answer_6=$(grep -v "^>" $sample \
 | head -1 \
 | wc -c)

 echo "answer-6: $answer_6"

#what is the name of the longest gene in 'genes.hg19.bed.gz'?

genes="$datasets/bed/genes.hg19.bed.gz"

answer_7=$(gzcat $genes \
| awk 'BEGIN {OFS="\t"} {print $3 - $2, $4}' \
| sort -k1nr \
| head -1 \
| cut -f2)

echo "answer-7: $answer_7"

genes="$datasets/bed/genes.hg19.bed.gz"

answer_8=$(gzcat $genes \
| cut -f1 \
| uniq \
| wc -l)

echo "answer-8: $answer_8"

peaks="$datasets/bed/peaks.chr22.bed.gz"

answer_9=$(gzcat $peaks\
| cut -f4 \
| grep "CTCF$" \
| wc -l)

echo "answer-9: $answer_9"

lamina="$datasets/bed/lamina.bed"

answer_10=$(awk 'BEGIN {OFS ="\t"} {print $1, $3 - $2}' $lamina \
| sort -k2nr \
| head -1 \
| cut -f1)

echo "answer-10: $answer_10"

