while getopts d:o: option; do
  case "${option}"
    in
    d) directory=${OPTARG};;
    o) order=${OPTARG};;
  esac
done

ascending="asc"
descending="desc"

if [ -z "$directory" ]; then
  echo "Directory must be passed in"
  exit 1
fi

if [ -z "$order" ]; then
  echo "Order must be passed in"
  exit 1
else
  if [ "$order" != "$ascending" ] && [ "$order" != "$descending" ]; then
    echo "Order must be ascending 'asc' or descending 'desc'"
    exit 1
  fi
fi

count=0
IFS=$'\n';
if [ "$order" == "$ascending" ]; then
  for file in $(ls $directory -Art); do
    origin="${directory}/${file}"
    destination="${directory}/${count}-${file}"
    $(mv $origin $destination)
    ((count+=1))
  done
else
  for file in $(ls $directory -At); do
    origin="${directory}/${file}"
    destination="${directory}/${count}-${file}"
    $(mv $origin $destination)
    ((count+=1))
  done
fi
