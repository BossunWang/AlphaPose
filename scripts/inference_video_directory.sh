set -x

CONFIG="configs/halpe_26/resnet/256x192_res50_lr1e-3_1x.yaml"
CKPT="pretrained_models/halpe26_fast_res50_256x192.pth"
VIDEO="/media/bossun/新增磁碟區/Datasets/DanceDatasets/DanceDatasets_part_video"
OUTDIR="/media/bossun/新增磁碟區/Datasets/DanceDatasets_part_video_2d_pose_data/"

python scripts/demo_inference_video_directory.py \
    --cfg ${CONFIG} \
    --checkpoint ${CKPT} \
    --video_dir ${VIDEO} \
    --outdir ${OUTDIR} \
    --detector yolox-x \
    --qsize 512