#!/usr/bin/env bash

## Tell the user on the first run, that he did not create any download tasks! He has to read this file and comment out this line
echo "You don't have any download tasks defined OR you just created tasks and did not uncomment this line! Check the file ./script/download.sh and read the comments!" && exit 1

## Start ##
# Create a new download directory if it doesn't exist yet
#mkdir -p one-piece
# Change directory to download directory
#cd one-piece || exit
# Download files
#crunchy-cli archive -a ja-JP -a de-DE -s de-DE -s en-US -o '[S{season_number}E{episode_number}] {title}.mkv' https://www.crunchyroll.com/de/series/GRMG8ZQZR/one-piece
# After finishing all downloads go back into the parent directory and start next task
#cd ..
## End ##
