#!/usr/bin/env bash

DATA=AAPD
MODEL=AttentionXML-aapd

./scripts/run_preprocess.sh $DATA
./scripts/run_xml.sh $DATA $MODEL

python evaluation.py \
--results results/$MODEL-$DATA-Ensemble-labels.npy \
--targets ../../datasets/multiLabel_text_classification/$DATA/test_labels.npy \
--train-labels ../../datasets/multiLabel_text_classification/$DATA/train_labels.npy