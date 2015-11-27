#!/bin/bash

## generate_test_reporting.sh: generating test reporting (HTML format)
##

########## VARIABLES ##########
coverageTot=0
nbFailTot=0

########## PROCESS ##########
echo -e "\n##### TESTS #####\n"
myFile="todolist_test_$(date '+%F_%H-%M-%S').html"
sudo bundle exec rspec -f h spec >> ~/${myFile}

grep "Finished in" ~/${myFile} | sed s/"<[^>]*>"/""/g | awk -F"= " '{print substr($2,2,length($2)-3)}'
grep "failures" ~/${myFile} | sed s/"<[^>]*>"/""/g | awk -F"= " '{print substr($2,2,length($2)-3)}'
nbFail=`grep "failures" ~/${myFile} | sed s/"<[^>]*>"/""/g | awk -F"= " '{print substr($2,2,length($2)-3)}' | awk -F" " '{print $3}'`
nbFailTot=$(($nbFailTot + $nbFail))
grep "Coverage" ~/${myFile}
coverage=`grep "Coverage" ~/${myFile} | sed  's/.*(\(.*\)).*/\1/' | sed s'/.$//'`
if [ ! -z "${coverage}" ]
then
    coverageTot=`echo "scale=2; ${coverageTot}+${coverage}" | bc`
fi

coverageAvg=`echo "scale=2; ${coverageTot}/1" | bc`

echo -e "\n\033[94mTotal failures: ${nbFailTot}\033[0m"
echo -e "\033[94mAverage coverage: (${coverageAvg}%) covered\033[0m"

if [ ${nbFailTot} -gt 0 ]
then
    exit -1
else
    exit 0
fi
