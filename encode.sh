#!/bin/sh

if [ $# -ne 4 ] ; then
  echo "Usage: encode.sh <input file> <width> <height> <output file name>";
  exit 1;
fi

input=$1;
width=$2
height=$3;
output=$4;

echo "Encoding $input to ascii $outout @ $width x $height"

session_id=$RANDOM;

source_dir=".$session_id/source-frames"
ascii_dir=".$session_id/ascii-frames"

# Create temp directories
mkdir -p $source_dir
mkdir -p $ascii_dir

# Convert video frames into images at 25fps
echo "Encoding frames to jpeg..."
ffmpeg -i $input -r 25 -f image2 $source_dir/%7d.jpg > /dev/null 2>&1

# Convert each frame into ascii
for frame in `ls -1 $source_dir/*.jpg`; do
  base=`basename $frame .jpg`;
  echo "Encoding $base to ascii..."
  img2txt -W $width -H $height -x 3 -y 5 $frame -f tga > $ascii_dir/$base.tga;
done

# Combine frames into new video
echo "Encoding frames back to video..."
ffmpeg -r 25 -f image2 -s 1920x1080 -i $ascii_dir/%07d.tga -vcodec libx264 -crf 25  -pix_fmt yuv420p $output > /dev/null 2>&1

# Clean up
echo "Cleaning temporary files..."
rm -rf ".$session_id"

echo "Done!"
