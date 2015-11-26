#!/bin/bash

## generate_test_reporting.sh: generating test reporting (HTML format)
##

########## PROCESS ##########
# integration tests
echo $(pwd)
sudo bundle exec rspec -f h spec >> ~/todolist_test_$(date "+%F_%H-%M-%S").html
