#!/bin/bash

base_dir=/home/azureuser/cloudfiles/code/Users/jimdilkes/bert-prune
models_dir=$base_dir/models
squad_train_file=$base_dir/data/squad_data/train-v2.0.json
squad_predict_file=$base_dir/data/squad_data/dev-v2.0.json

# in_model=$models_dir/bert-prune-30
in_model=$models_dir/bert-prune-50
# out_model=$models_dir/bert-prune-30-squad
out_model=$in_model-squad

bert_dir=$base_dir/bert
orig_model=$models_dir/uncased-bert-prunable

params="
--train_file $squad_train_file
--predict_file $squad_predict_file
--init_checkpoint $in_model
--output_dir $out_model
--bert_config_file $orig_model/bert_config.json
--vocab_file $orig_model/vocab.txt
--train_batch_size 32
--max_seq_length 128
--keep_checkpoint_max 13
--num_train_epochs 3.0
--do_lower_case 
--version_2_with_negative
--learning_rate 2e-5"

python $bert_dir/run_squad.py --do_train $params
python $bert_dir/run_squad.py --do_eval --do_predict $params