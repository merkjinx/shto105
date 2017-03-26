# algorithm: sha512(sha256($username)sha256($password)$salt)

logfile="/Users/$USER/library/logs/terminal_login.log"
masterpassword="9325f17558aae676947c245b9bc98eb6786293e127d721e495ed90ea443ae706647d75fc97b03713e3c213ba7f45f4637084d66c76d76ef3b36f2af26e78cbb9"
salt="CE46+J9EYk2[nE"


echo "
███████╗██╗███████╗ █████╗      █████╗  ██████╗ ███████╗███╗   ██╗████████╗
██╔════╝██║██╔════╝██╔══██╗    ██╔══██╗██╔════╝ ██╔════╝████╗  ██║╚══██╔══╝
█████╗  ██║███████╗███████║    ███████║██║  ███╗█████╗  ██╔██╗ ██║   ██║
██╔══╝  ██║╚════██║██╔══██║    ██╔══██║██║   ██║██╔══╝  ██║╚██╗██║   ██║
██║     ██║███████║██║  ██║    ██║  ██║╚██████╔╝███████╗██║ ╚████║   ██║
╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═══╝   ╚═╝

██╗      ██████╗  ██████╗ ██╗███╗   ██╗
██║     ██╔═══██╗██╔════╝ ██║████╗  ██║
██║     ██║   ██║██║  ███╗██║██╔██╗ ██║
██║     ██║   ██║██║   ██║██║██║╚██╗██║
███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║
╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝
" | lolcat

function hashdatshit {

loginhash=$(echo $login | shasum -a 256 | cut -c 1-64)
passhash=$(echo $password | shasum -a 256 | cut -c 1-64 )
masterhash=$(echo $loginhash$passhash$salt | shasum -a 512 | cut -c 1-128)

}



echo "Please login to continue"
echo -n Login:
read login
echo -n Password:
read password

hashdatshit
passwordhashed=$masterhash



if [ "$passwordhashed" == "$masterpassword" ];
then
 clear
 export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$"
 echo "Correct Login: Welcome Master"
 echo "Correct terminal login: User: $USER : $login @$(date)" >> $logfile
 #export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$"
else
 echo "Incorrect Password Nice try :) "
 echo "this will be reported"
 echo "Incorrect terminal login: User: $USER : $login @$(date)" >> $logfile
 kill $PPID
fi
