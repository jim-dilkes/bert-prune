#! /bin/bash
#$ -cwd
#$ -V
#$ -l gpu=1,h_rt=24:00:00,num_proc=2,mem_free=3G
#$ -j y
#$ -m ase
#$ -M mitchell.gordon95@gmail.com
#$ -q gpu.q@@1080
ml load cuda90/toolkit
export PYTHONPATH=.
python create_pretrain_data_batch.py
