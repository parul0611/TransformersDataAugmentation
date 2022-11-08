#!/usr/bin/env bash

mkdir datasets
NUMDEV=10
NUMEXP=15

# STSA dataset
mkdir -p datasets/sts
for split in train dev test;
  do
    wget -O datasets/sts/${split}.raw  https://github.com/clairett/pytorch-sentiment-classification/tree/master/data/SST2/${split}.tsv
    python numtotext.ipynb -i datasets/sts/${split}.raw -o datasets/sts/${split}.tsv -d sts
    rm datasets/sts/${split}.raw
  done
python create_fsl_dataset.ipynb -datadir datasets/sts -num_train 10 -num_dev $NUMDEV -sim $NUMEXP -lower


