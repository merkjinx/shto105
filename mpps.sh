salt="CE46+J9EYk2[nE" # change me to your liking
echo "enter username"
echo -n Username:
read username
echo "enter password"
echo -n Password:
read -s password
os1=$(echo $username | shasum -a 256 | cut -c 1-64)
os2=$(echo $password | shasum -a 256 | cut -c 1-64)
sc1=$os1$os2$salt
masterpass=$(echo $sc1 | shasum -a 512 | cut -c 1-128)
echo ""
echo "$masterpass"
