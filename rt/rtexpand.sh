echo -n "what is the chain length:"
read length
echo -n "what is the password length"
read passlength
echo "starting..."

filelen=$(wc -l $1 | cut -c 6-9)

for (( i = 1; i <= $filelen; i++))
do
rthash=$(sed -n "$i"p $1 )
lad1=$(echo $rthash | awk -F '[ \t]+|/' '{print $1}' )
lad2=$(echo $rthash | awk -F '[ \t]+|/' '{print $2}' )
start=$(echo $lad1 | md5)
proc=$start
 for (( c = 0; c <= $length; c++))
 do
  proc=$(echo $parse | md5)
  parse=$(echo $proc | cut -c 1-$passlength)
  echo $parse >> gddd.txt

  if [ "$proc" == "$lad2" ]; then
   echo "Completed chain: $i"
   break;
  fi
 done

done
