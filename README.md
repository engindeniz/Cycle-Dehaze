# Cycle-Dehaze

This reposotory is a demo for <a href="http://www.vision.ee.ethz.ch/ntire18/" target="_blank">CVPR 2018 Workshop</a>.

The code is based on <a href="https://github.com/vanhuyz/CycleGAN-TensorFlow" target="_blank">CycleGAN-TensorFlow</a> implementation.

# Model Architecture


<img src="figs/model.png" width="800">

# Prerequisites

* TensorFlow 1.4.1
* Python 3
* MATLAB 

Our code is tested under Ubuntu 16.04 environment with Titan X GPUs.

# Demo

* Test the model for Track 1: Indoor

```sh
 sh demo.sh data/indoor results/indoor models/Hazy2GT_indoor.pb
```

* Test the model for Track 2: Outdoor

```sh
sh demo.sh data/outdoor results/outdoor models/Hazy2GT_outdoor.pb
```

*  You can use this model for your own images. 

```sh
sh demo.sh input_folder output_folder model_name
```

# License
This project is licensed under the MIT License - see the <a href="https://github.com/engindeniz/Cycle-Dehaze/blob/master/LICENSE">LICENSE</a> file for details.
