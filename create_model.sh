#!/bin/bash

set -e
today="$(date '+%d_%m_%Y_%T')"

CUDA_VISIBLE_DEVICES="" python3 export_graph.py --checkpoint_dir checkpoints/Hazy2GT \
                        --XtoY_model Hazy2GT_$today.pb \
                        --YtoX_model GT2Hazy_$today.pb \
                        --image_size1 256 \
                        --image_size2 256

