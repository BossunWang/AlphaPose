import os
import glob
from moviepy.editor import VideoFileClip
from time import sleep




def main():
    video_path = "/media/bossun/新增磁碟區/Datasets/DanceDatasets/DanceDatasets_video/"
    videos = sorted(glob.glob(os.path.join(video_path, "*/*.mp4")))
    target_path = "/media/bossun/新增磁碟區/Datasets/DanceDatasets/DanceDatasets_part_video/"
    os.makedirs(target_path, exist_ok=True)

    partDura = 30  # duration of a part in seconds
    for video in videos:
        fullDura = VideoFileClip(video).duration
        startPos = 0

        i = 1
        while True:
            endPos = startPos + partDura

            if endPos > fullDura:
                endPos = fullDura

            try:
                clip = VideoFileClip(video).subclip(startPos, endPos)
                part_name = os.path.splitext(os.path.basename(video))[0] + "p" + str(i) + ".mp4"
                part_path = os.path.join(target_path, part_name)
                print(part_path)
                clip.to_videofile(part_path, codec="libx264", temp_audiofile='temp-audio.m4a', remove_temp=True,
                                  audio_codec='aac')
                print("part ", i, "done")
            except:
                print("part ", i, "error")
                break
            i += 1

            startPos = endPos  # jump to next clip

            if startPos >= fullDura:
                break


if __name__ == '__main__':
    main()