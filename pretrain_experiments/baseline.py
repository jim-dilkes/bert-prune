import subprocess
from univa_grid import TaskRunner
from pretrain_experiments.common import TRAIN_128, DEV_128, pretrain, pretrain_eval, SparsityHParams

OUTPUT_DIR = "models/uncased_base_baseline"
MODEL_NAME = "baseline"

for step in range(20):
    # TODO (mitchg) - also finetune on max_seq_len=500
    pretrain(model_name=MODEL_NAME, input_file=TRAIN_128, num_train_steps=5000*step, sparsity_hparams=None)
    # TODO (mitchg) what's the right number here?
    pretrain_eval(model_name=MODEL_NAME, input_file=DEV_128, max_eval_steps=2000)
