#!/bin/bash

# Dehaze all given images under a folder with given model
# Example Usage: sh convertHazy2GT.sh folder_name model_name

for i in $1/*; do
	echo $i
	CUDA_VISIBLE_DEVICES="" python3 inference.py --model $2 \
        	             			     --input $i \
                	                             --output $i \
                        	                     --image_size 256
done

