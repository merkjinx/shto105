#echo -n "Enter pattern:"
#read pattern
pattern=$1
length=${#pattern}
echo "calculating"
echo

nombre=0
totalhashes=1


start=`date +%s`
while :
do
#rand=$RANDOM

nombre=$((nombre+1))
totalhashes=$((totalhashes+1))

jhash=$(echo $nombre | md5)
parse=$(echo $jhash | cut -c 1-$length)
if [ "$parse" == "$pattern" ]
then
 echo "Here $jhash"
 echo "pattern: $pattern"
 echo "Root $nombre"
 break
fi

done
end=`date +%s`
runtime=$( echo "$end - $start" | bc -l )
hashpermin=$((totalhashes/runtime))

echo
echo "Summary:"
echo "calculated in $runtime seconds @ $hashpermin hashes per second"
