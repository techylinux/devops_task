#!/bin/bash

# This script is to find the Process consuming more than 3% of cpu and memory
############## VARIABLE SECTION ##################################
 CPU=`ps aux --sort=-%cpu | awk '{ if ($4>"3.0" ) print $2, $11 }'`
 MEM=`ps aux --sort=-%cpu | awk '{ if ($3>"3.0" ) print $2, $11 }'`
 PROC_5=`ps -eoetime=,pid=,cmd= | awk 'int(substr($1,1,index($1,"-"))) > 5 { print }'| awk '{print $2, $3}'`
 PROC_10=`ps -eoetime=,pid=,cmd= | awk 'int(substr($1,1,index($1,"-"))) > 10 { print }'| awk '{print $2, $3}'`
 PROC_15=`ps -eoetime=,pid=,cmd= | awk 'int(substr($1,1,index($1,"-"))) > 15 { print }'| awk '{print $2, $3}'`
 
################################## Main program section #############################################

 echo -e  "\e[3;31m Here is the top processes consuming cpu load at `date +%F_%R`\e[0m"
 echo "=======================================";echo "$CPU"; echo "======================================="
   if [ -z "$CPU" ]
    then echo -e  "\nNo process consuming CPU load more than 3%" 
   fi
 echo -e "\n"
 echo -e  "\e[3;31m Top processes consuming more memory at `date +%F_%R`\e[0m"
 echo "======================================="; echo "$MEM"; echo "======================================"
   if [ -z "$MEM" ]
    then echo -e "\nNo Processes consuming Mem more than 3%"
   fi
 echo -e "\n"
 echo -e "\e[3;31m Process running from past 5 days\e[0m"
 echo "======================================="; echo "$PROC_5"; echo "==================================="  
 echo -e "\n" 
 echo -e "\e[3;31m Process running from past 10 days\e[0m"
 echo "======================================="; echo "$PROC_10"; echo "==================================="  
 echo -e "\n" 

 echo -e "\e[3;31m Process running from past 15 days\e[0m"
 echo "======================================="; echo "$PROC_15"; echo "==================================="  
