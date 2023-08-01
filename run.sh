
if [ ! -z $1 ] 
then
  echo "running $1"
else 
  echo "please specify executable"
fi

node sync.js && swift run $1

