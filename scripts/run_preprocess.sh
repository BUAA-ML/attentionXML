#!/usr/bin/env bash

#pip install nltk

#if [ $1 == "EUR-Lex" ]; then
#  TRAIN_TEXT="--text-path ../datasets/$1/train_texts.txt"
#  TEST_TEXT="--text-path ../datasets/$1/test_texts.txt"
#else
#  TRAIN_TEXT="--text-path ../datasets/$1/train_raw_texts.txt --tokenized-path data/$1/train_texts.txt"
#  TEST_TEXT="--text-path ../datasets/$1/test_raw_texts.txt --tokenized-path data/$1/test_texts.txt"
#fi

TRAIN_TEXT="--text-path ../datasets/AAPD/train_texts.txt"
TEST_TEXT="--text-path ../datasets/AAPD/test_texts.txt"

if [ ! -f data/$1/train_texts.npy ]; then
  python preprocess.py $TRAIN_TEXT --label-path ../datasets/AAPD/train_labels.txt --vocab-path ../datasets/AAPD/vocab.npy --w2v-model ../datasets/word_embedding/glove.840B.300d.gensim --emb-path ../datasets/AAPD/emb_init.npy
fi
if [ ! -f data/$1/test_texts.npy ]; then
  python preprocess.py $TEST_TEXT --label-path ../datasets/AAPD/test_labels.txt --vocab-path ../datasets/AAPD/vocab.npy
fi


#TRAIN_TEXT="--text-path ../../datasets/multiLabel_text_classification/AAPD/train_texts.txt"
#TEST_TEXT="--text-path ../../datasets/multiLabel_text_classification/AAPD/test_texts.txt"
#
#if [ ! -f data/$1/train_texts.npy ]; then
#  python preprocess.py $TRAIN_TEXT --label-path ../../datasets/multiLabel_text_classification/AAPD/train_labels.txt --vocab-path ../../datasets/multiLabel_text_classification/AAPD/vocab.npy --w2v-model ../../datasets/word_embedding/glove.840B.300d.gensim --emb-path ../../datasets/multiLabel_text_classification/AAPD/emb_init.npy
#fi
#if [ ! -f data/$1/test_texts.npy ]; then
#  python preprocess.py $TEST_TEXT --label-path ../../datasets/multiLabel_text_classification/AAPD/test_labels.txt --vocab-path ../../datasets/multiLabel_text_classification/AAPD/vocab.npy
#fi