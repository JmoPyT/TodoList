#!/bin/bash

## generate_test_reporting.sh: generating test reporting (HTML format)
##

########## PROCESS ##########
# integration tests
echo $(pwd)
myFile="todolist_test_$(date '+%F_%H-%M-%S').html"
sudo bundle exec rspec -f h spec >> ~/${myFile}

grep "Finished in" ~/${myFile}
grep "failures" ~/${myFile}
grep "Coverage" ~/${myFile}
