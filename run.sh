
if [ ! -z $1 ] 
then
  echo "running $1"
fi

node sync.js && swift run $1

