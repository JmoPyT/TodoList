#!/bin/bash

## generate_test_reporting.sh: generating test reporting (HTML format)
##

########## PROCESS ##########
# integration tests
echo $(pwd)
myFile="todolist_test_$(date '+%F_%H-%M-%S').html"
sudo bundle exec rspec -f h spec >> ~/${myFile}

grep "Finished in" ~/${myFile} | sed s/"<[^>]*>"/""/g | awk -F"= " '{print substr($2,2,length($2)-3)}'
grep "failures" ~/${myFile} | sed s/"<[^>]*>"/""/g | awk -F"= " '{print substr($2,2,length($2)-3)}'
grep "Coverage" ~/${myFile}

exit -1
