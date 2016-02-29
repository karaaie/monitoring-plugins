#!/bin/bash

# Author: Kamil Hakim, Karaaie@Github
# Date: 2016-02-29
# Usage: ./check_file_count.sh -c 0 -w 1 /my/path 
#


while [[ $# > 1 ]]
do
key="$1"

case $key in
    -w |--warn)
    WARN="$2"
    shift # past argument
    ;;
    -c |--critical)
    CRITICAL="$2"
    shift # past argument
    ;;
    -f|--folder)
    FOLDER="$2"
    shift # past argument
    ;;
    -r|--recurse)
    RECURSE=1
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done

if [ ! -d $FOLDER ]
  then
  echo "CRITICAL: no such folder $FOLDER"
fi

COUNT=$(ls $FOLDER | wc -l)

if [ $COUNT -gt $WARN ]
then
  echo "OK"
elif [ $COUNT -le $WARN ] && [ $COUNT -gt $CRITICAL ]
then
  echo "WARNING"
else
  echo "CRITICAL"
fi
