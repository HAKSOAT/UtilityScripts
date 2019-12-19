while getopts f:d: option; do
  case "${option}"
    in
    f) file=${OPTARG};;
    d) destination=${OPTARG};;
  esac
done

echo $file;

while IFS="" read -r line || [ -n "$p" ];
do
  touch "${destination}/${line}"
done < "${file}"

