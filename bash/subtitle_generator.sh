# This will translate and transcribe all audio files in the target directory

echo "Transcribing audios.."
find ../../<target dir>/ -type f \( -name '*.mp3' \) | while read file; do
    current="$file"
    check="${current:0:(-4)}.srt"
    if [[ ! -f "$check" ]]; then # skip already transcribed audios
      echo Converting "$file"
      ./Whisper/whisper-faster "$file" --skip -pp -m medium -f srt -o source --language <target language> --task translate --standard
   fi
done
echo "done transcribing audios"
