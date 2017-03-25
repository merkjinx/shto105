echo -n "Chain Length:"
read length
echo -n "How many chains:"
read chains
echo -n "password length 2-32:"
read passlength

for (( i = 0 ; i <= $chains ; i++))
do
 adf=$RANDOM
 beginner=$(echo $adf | md5)
 nexthash=$beginner

 for (( c = 0 ; c <= $length ; c++))
 do

  nexthash=$(echo $parse | md5)
  parse=$(echo $nexthash | cut -c 1-$passlength)

 done
 echo $adf $nexthash >> $1

done
