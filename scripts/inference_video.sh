set -x

CONFIG="configs/halpe_26/resnet/256x192_res50_lr1e-3_1x.yaml"
CKPT="pretrained_models/halpe26_fast_res50_256x192.pth"
VIDEO="/workspace/Datasets/DanceDatasets/DanceDatasets_part_video/delight_026_20231017_0#0-213#0p6.mp4"
OUTDIR=${4:-"./examples/res_video"}

python scripts/demo_inference.py \
    --cfg ${CONFIG} \
    --checkpoint ${CKPT} \
    --video ${VIDEO} \
    --outdir ${OUTDIR} \
    --detector yolox-x \
    --save_video
