#!/bin/bash


#	do (echo  | echo "Example: ./forensic_script.sh auth.log" | ./forensic_script.sh)
#	done

var="$1"
if [ ! -n "$var" ]
then
	echo
	echo "Filename or path not detected! Please execute script like this: $0 <FILENAME OR PATH HERE>"
	exit 1
else
	echo
fi

start=$(head -1 "$var" | cut -d" " -f1-3)
echo "Start of capture: $start"
end=$(tail -1 "$var" | cut -d" " -f1-3)
echo "End of Capture: $end"

starttime=$(date -d "$start" +%s)
#echo $starttime
endtime=$(date -d "$end" +%s)
#echo $endtime

totalseconds=$(("$endtime" - "$starttime"))

echo "Duration in seconds: $totalseconds"

totalminutes=$(echo "$totalseconds/60" | bc -l)

echo "Duration in minutes: $totalminutes"

totalhours=$(echo "$totalminutes/60" | bc -l)

echo "Duration in hours: $totalhours"
