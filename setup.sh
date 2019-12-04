#!/usr/bin/env bash

pip install -r requirements.txt
wget https://github.com/explosion/spacy-models/releases/download/en_vectors_web_lg-2.1.0/en_vectors_web_lg-2.1.0.tar.gz -O en_vectors_web_lg-2.1.0.tar.gz
pip install en_vectors_web_lg-2.1.0.tar.gz

# Download vqa v2 dataset
VQA_DIR=./datasets/vqa
mkdir -p $VQA_DIR
wget https://s3.amazonaws.com/cvmlp/vqa/mscoco/vqa/v2_Questions_Train_mscoco.zip -O $VQA_DIR/v2_Questions_Train_mscoco.zip
wget https://s3.amazonaws.com/cvmlp/vqa/mscoco/vqa/v2_Questions_Val_mscoco.zip -O $VQA_DIR/v2_Questions_Val_mscoco.zip
wget https://s3.amazonaws.com/cvmlp/vqa/mscoco/vqa/v2_Questions_Test_mscoco.zip -O $VQA_DIR/v2_Questions_Test_mscoco.zip
#wget https://s3.amazonaws.com/cvmlp/vqa/mscoco/vqa/v2_Annotations_Train_mscoco.zip -O $VQA_DIR/v2_Annotations_Train_mscoco.zip
wget https://s3.amazonaws.com/cvmlp/vqa/mscoco/vqa/v2_Annotations_Val_mscoco.zip -O $VQA_DIR/v2_Annotations_Val_mscoco.zip

unzip $VQA_DIR/v2_Questions_Train_mscoco.zip -d $VQA_DIR/
unzip $VQA_DIR/v2_Questions_Val_mscoco.zip -d $VQA_DIR/
unzip $VQA_DIR/v2_Questions_Test_mscoco.zip -d $VQA_DIR/
#unzip $VQA_DIR/v2_Annotations_Train_mscoco.zip -d $VQA_DIR/
unzip $VQA_DIR/v2_Annotations_Val_mscoco.zip -d $VQA_DIR/

