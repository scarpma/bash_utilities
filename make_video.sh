#!/bin/bash
#
# -c:v libx264: Use video codec libx264.
# 
#     You can specify video compression parameters here, if you like:
#     -crf <number>: Quality setting. 0 to 51. 23 is the default. 0 is true lossless encoding, which will be quite high bandwidth. 18 is nearly visually lossless.
# 
# -r 30: Set the output framerate to 30 FPS.
#
# -y: overwrite file if already present
# 
# -t 20: 20 seconds output 
#
# 
# fps filter sets the frame rate. A rate of 10 frames per second is used in the example.
# 
# scale filter will resize the output to 320 pixels wide and automatically determine the height while preserving the aspect ratio. The lanczos scaling algorithm is used in this example.
# 
# palettegen and paletteuse filters will generate and use a custom palette generated from your input. These filters have many options, so refer to the links for a list of all available options and values. Also see the Advanced options section below.
# 
# split filter will allow everything to be done in one command and avoids having to create a temporary PNG file of the palette.
# 
# Control looping with -loop output option but the values are confusing. A value of 0 is infinite looping, -1 is no looping, and 1 will loop once meaning it will play twice. So a value of 10 will cause the GIF to play 11 times.
#
#
# https://superuser.com/questions/556029/how-do-i-convert-a-video-to-gif-using-ffmpeg-with-reasonable-quality
# https://www.bannerbear.com/blog/how-to-make-a-gif-from-a-video-using-ffmpeg/


echo "input: ${1}*.png"
echo "output: ${2}.mp4, output: ${2}.gif"

# mp4
cat ${1}*.png | ffmpeg -f image2pipe -r 60 -i - -c:v libx264 "${2}.mp4" -y -crf 1

# gif
ffmpeg -i ${2}.mp4 -y \
  -filter_complex "[0:v]fps=20,scale=1200:-1,split [a][b];[a] palettegen [p];[b][p] paletteuse" \
  -loop 0 \
  ${2}.gif 
#
#
## avi
#cat *.png | ffmpeg -f image2pipe -t 2 -i - -c:v libx264 out.avi -y -crf 30

