#using shrt 1.0
#this program's entire design is to teach people about the workings of rainbow tables


echo "Welcome to rtcrack.sh" 
if [ -z "$1" ]
then
      echo "usage rtcrack.sh <md5 hash> <rt file> <password length>"
fi
if [ -z "$2" ]
then
      echo "usage rtcrack.sh $1 <rt file> <password length>"
fi
if [ -z "$3" ]
then
      echo "usage rtcrack.sh $1 $2 <password length>"
fi


filelen=$(wc -l $2 | cut -c 6-9)

for (( i = 1; i <= $filelen; i++))
do
  rthash=$(sed -n "$i"p $2 )
  lad1=$(echo $rthash | awk -F '[ \t]+|/' '{print $1}' )
  lad2=$(echo $rthash | awk -F '[ \t]+|/' '{print $2}' )
  
  start=$(echo $lad1 | md5)
  proc=$start
  plaintext=$(echo $start | md5)
  
  while :
  do
    proc=$(echo $proc | md5)
    plaintext=$(echo $plaintext | cut -c 1-$passlength)
    
    if [ "$1" == "$proc" ]; then
      echo "Found!!!"
      echo hash: $1
      echo plaintext: $plaintext
      exit
    fi
    if [ "$proc" == "$lad" ]; then
      echo "end of chain: $i
      break
    fi

  done

done
