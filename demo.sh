# You need to put your dataset under "data" folder!!
# Example Usage: sh demo.sh folder_name result_folder model_name
# sh demo.sh test-ori final-models/Hazy2GT_indoor.pb --> Track1: Indoor
# sh demo.sh test-ori-out final-models/Hazy2GT_outdoor.pb --> Track2: Outdoor


echo "Please wait.."
set -e
today="$(date '+%d_%m_%Y_%T')"


pathInput=${1%/}
pathOutput=${2%/}
modelfile="$3"

path_downscaled="$pathOutput/temp"

if [ ! -d $path_downscaled ]; then
  mkdir $path_downscaled
fi


#Create log file
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>logs/log_$today.out 2>&1

#Downscaling
command="resize_im('$pathInput','$path_downscaled')"
matlab -nojvm -nodesktop -r $command

#Dehazing
sh convertHazy2GT.sh "$path_downscaled" "$modelfile"

#Upscaling
command="laplacian('$path_downscaled','$pathInput','$pathOutput')"
matlab -nojvm -nodesktop -r $command

if [ -d $path_downscaled ]; then
  rm -rf $path_downscaled
fi

 

