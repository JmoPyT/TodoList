#!/bin/bash

## generate_test_reporting.sh: generating test reporting (HTML format)
##

########## PROCESS ##########
# integration tests
sudo rm -f /home/jmpayet/todolist_test_$(date "+%F_%X").html
sudo bundle exec rspec -f h spec >> /home/jmpayet/todolist_test_$(date "+%F_%X").html
