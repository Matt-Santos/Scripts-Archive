# Convert all video files to standard 720p mp4 format using ffmpeg
# Convert all audio files to standard mp3 format using ffmpeg

echo "converting Videos..."
find ../../ -type f \( -name '*.mp4' -o -name '*.mkv' -o -name '*.avi' \) | while read file; do
   width=$(ffprobe -v error -select_streams v -show_entries stream=width -of csv=p=0 "$file")
   if [[ "$file" != *".mp4" || $width != 720 ]]; then
      echo Converting "$file"
      #echo File is $width
      ffmpeg -nostdin -i "$file" -vf scale="720:-2" temp.mp4
      mv -f temp.mp4 "${file:0:-4}".mp4
   fi
done
echo "done converting videos"

echo "converting audios.."
find ../../ -type f \( -name '*.wav' \) | while read file; do
   echo Converting "$file"
   ffmpeg -nostdin -i "$file" -vn -b:a 192k temp.mp3
   mv -f temp.mp3 "${file:0:-4}".mp3
   rm "$file"
done
find ../../ -type f \( -name '*.mpga' \) | while read file; do
   echo Converting "$file"
   ffmpeg -nostdin -i "$file" -vn -b:a 192k temp.mp3
   mv -f temp.mp3 "${file:0:-5}".mp3
   rm "$file"
done
echo "done converting audios"
