# mp4
# -c:v libx264: Use video codec libx264.
# 
#     You can specify video compression parameters here, if you like:
#     -crf <number>: Quality setting. 0 to 51. 23 is the default. 0 is true lossless encoding, which will be quite high bandwidth. 18 is nearly visually lossless.
# 
# -r 30: Set the output framerate to 30 FPS.
#
# -y: overwrite file if already present
cat *.png | ffmpeg -f image2pipe -r 60 -i - -c:v libx264 out.mp4 -y -crf 30

# gif
cat *.png | ffmpeg -f image2pipe -r 60 -i - out.gif -y


# avi
cat *.png | ffmpeg -f image2pipe -r 60 -i - -c:v libx264 out.avi -y -crf 30

