#This file help to guide how to use the scripts
########################## Regarding aws Script ####################################
Steps:
Prerequisites:
1) Please make sure aws-cli tool is installed in your system which will help the script to make api calls on aws website to fetch the required details
2) Run the script ./awscript.sh to fetch all the details in a single command
3) Take the output in external file

############################ Monitoring linux system for its processes ################
As script is already packed in this repository.Put the script in crontab to fetch the details every 15 minutes as below:
*/15 * * * * ./monitoring.sh > output.csv
Above cmd will fetch the detail and genrate the output in output.csv file 

