#!/usr/bin/env bash

gource --output-custom-log gource1.txt
gource ../../pcg-back/ -output-custom-log gource2.txt

sed -i -r "s#(.+)\|#\1|/front#" gource1.txt
sed -i -r "s#(.+)\|#\1|/back#" gource2.txt

(IFS="|"
while read wrong_name name; do
  sed -i "s/|$wrong_name|/|$name|/g" gource1.txt
done < name_replacements.txt)

(IFS="|"
while read wrong_name name; do
  sed -i "s/|$wrong_name|/|$name|/g" gource2.txt
done < name_replacements.txt)

cat gource1.txt gource2.txt | sort -n > combined.txt

gource combined.txt -1920x1080 --max-user-speed 500 --seconds-per-day 0.7 -e 0.0001 -a 1 --title "COVID Frontend Development" --logo ../android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png --user-image-dir ./imgs -o - | ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 -crf 10 -pix_fmt yuv420p -threads 0 -bf 0 gource.mp4
rm gource1.txt

