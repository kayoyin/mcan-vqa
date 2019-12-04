# Deep Modular Co-Attention Networks (MCAN)

This repository corresponds to the **PyTorch** implementation of the MCAN for VQA, which won the champion in [VQA Challgen 2019](https://visualqa.org/roe.html). With an ensemble of 27 models, we achieved an overall accuracy **75.23%** and **75.26%** on *test-std* and *test-challenge* splits, respectively. See our  [slides](https://drive.google.com/open?id=1geJTEVMMGs9Y3S2_pZxNzgPMccfYpM_r) for details.

By using the commonly used bottom-up-attention visual features, a single MCAN model delivers **70.70%** (small model) and **70.93%** (large model) overall accuracy on the *test-dev* split of *VQA-v2* dataset respectively, which significantly outperform existing state-of-the-arts. Please check our [paper](http://openaccess.thecvf.com/content_CVPR_2019/html/Yu_Deep_Modular_Co-Attention_Networks_for_Visual_Question_Answering_CVPR_2019_paper.html) for details.

![Overview of MCAN](misc/mcan_overall.png)

## Changes on this fork by Kayo:
- Only download and use validation set
- Edit `core` to allow use on CPU
- Add script for validation

## Prerequisites

#### Setup 

 The image features are extracted using the [bottom-up-attention](https://github.com/peteanderson80/bottom-up-attention) strategy, with each image being represented as an dynamic number (from 10 to 100) of 2048-D features. We store the features for each image in a `.npz` file. Download the extracted features from [OneDrive](https://awma1-my.sharepoint.com/:f:/g/personal/yuz_l0_tn/EsfBlbmK1QZFhCOFpr4c5HUBzUV0aH2h1McnPG1jWAxytQ?e=2BZl8O) or [BaiduYun](https://pan.baidu.com/s/1C7jIWgM3hFPv-YXJexItgw#list/path=%2F). Download the val2014.tar.gz package corresponding to the features for the val images for *VQA-v2*. You should place it as follow:

```angular2html
|-- datasets
	|-- coco_extract
	|  |-- val2014.tar.gz
```

Besides, we use the VQA samples from the [visual genome dataset](http://visualgenome.org/) to expand the training samples. Similar to existing strategies, we preprocessed the samples by two rules:

1. Select the QA pairs with the corresponding images appear in the MSCOCO train and *val* splits.
2. Select the QA pairs with the answer appear in the processed answer list (occurs more than 8 times in whole *VQA-v2* answers).

For convenience, we provide our processed vg questions and annotations files, you can download them from [OneDrive](https://awma1-my.sharepoint.com/:f:/g/personal/yuz_l0_tn/EmVHVeGdck1IifPczGmXoaMBFiSvsegA6tf_PqxL3HXclw) or [BaiduYun](https://pan.baidu.com/s/1QCOtSxJGQA01DnhUg7FFtQ#list/path=%2F), and unzip and place them as follow:


```angular2html
|-- datasets
	|-- vqa
	|  |-- VG_questions.json
	|  |-- VG_annotations.json
```

After that, you can run the following script to setup all the needed configurations for the experiments

```bash
$ virtualenv --python=python3 venv
$ source venv/bin/activate
$ sh setup.sh
```

Running the script will: 

1. Download the QA files for [VQA-v2](https://visualqa.org/download.html).
2. Install requirements

Finally, the `datasets` folders will have the following structure:

```angular2html
|-- datasets
	|-- coco_extract
	|  |-- val2014
	|  |  |-- COCO_val2014_...jpg.npz
	|  |  |-- ...
	|-- vqa
	|  |-- v2_OpenEnded_mscoco_val2014_questions.json
	|  |-- v2_mscoco_val2014_annotations.json
	|  |-- VG_questions.json
	|  |-- VG_annotations.json

```

Download the pretrained `small` model and place it as below from [OneDrive](https://awma1-my.sharepoint.com/:f:/g/personal/yuz_l0_tn/EtNU5OG1dNhMq8M1pgeuQZwBgcj2RQCVnzLGDeDfnejPMQ?e=ynYhvk) or [BaiduYun](https://pan.baidu.com/s/1GW_SFErXSIBJ2Ojg2qaRmw#list/path=%2F), and you should unzip and put them to the correct folders as follows:


```angular2html
|-- ckpts
	|-- ckpt_small
	|  |-- epoch13.pkl

```

## Validation and Testing

run `sh validate.sh`

## Citation

If this repository is helpful for your research, we'd really appreciate it if you could cite the following paper:

```
@inProceedings{yu2019mcan,
  author = {Yu, Zhou and Yu, Jun and Cui, Yuhao and Tao, Dacheng and Tian, Qi},
  title = {Deep Modular Co-Attention Networks for Visual Question Answering},
  booktitle = {Proceedings of the IEEE Conference on Computer Vision and Pattern Recognition (CVPR)},
  pages = {6281--6290},
  year = {2019}
}
```
