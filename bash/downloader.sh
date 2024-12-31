# Bash Script to download via listing

echo "Starting Download"
let count=1
let total=`cat Download_List.txt | wc -l`
cat Download_List.txt | while read line || [[ -n $line ]];
do
   echo "File # $count/$total"
   cd "<target dir>"
   <secure-wrapper> megadl $line
   let count=$count+1
done
echo "Done Downloading"
