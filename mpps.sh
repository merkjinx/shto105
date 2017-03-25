# algorithm: sha512(sha256($username)sha256($password)$salt)

# variables
grey="\033[0;37m"
transparent="\e[0m"
salt="CE46+J9EYk2[nE" # change me to your liking


function getuser_input {
echo "Note: you should change the salt for added security"
echo "enter username"
echo -n Username:
read username
echo "enter password"

echo -n Password:
read -s password


}

function iscomfirm {
echo "is this correct?"
echo "username: $username"
echo -n "yes[1] no[2]:"
read answer1
if [ "$answer1" -eq 2 ]
then
 getuser_inpurt
fi

echo "is this correct?"
echo -n "password: "
printf $grey
printf $password
printf $transparent

echo ""
echo -n "yes[1] no[2]:"
read answer2
if [ "$answer2" -eq 2 ]
then
 getuser_input
fi

}

function hash {
os1=$(echo $username | shasum -a 256 | cut -c 1-64)
os2=$(echo $password | shasum -a 256 | cut -c 1-64)

sc1=$os1$os2$salt

masterpass=$(echo $sc1 | shasum -a 512 | cut -c 1-128)
}


getuser_input
iscomfirm
hash

echo ""
echo "salt=$salt"
echo "$masterpass"
