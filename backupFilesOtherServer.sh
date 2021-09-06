#! /bin/bash

# Backup generated automatically between 08:00 and 18:30 every 30 minutes

pass=$(openssl rsautl -inkey pass.txt -decrypt <output.bin)

function generateDate(){
	date=$(date +%F_%H-%M-%S)
	echo "$date"
}

function appointmentTime(){
	hora=$(date +%H-%M-%S-%2N)
	echo "$hora"
}

function generateBackup(){
	date=$(generateDate)
	folder_backup=/media/admin/Backup/Backups-Example/$date
	mkdir $folder_backup && sshpass -p $pass scp -r user@domain:/srv/www/htdocs/folder $folder_backup
}

while [ True ]
do
	date_time="$(appointmentTime)"
	if [ "$date_time" == "08-00-00-00" ] || [ "$date_time" == "08-30-00-00" ] || [ "$date_time" == "09-00-00-00" ] || [ "$date_time" == "09-30-00-00" ] || [ "$date_time" == "08-34-30-00" ]
	then
		echo "Generated"
		generateBackup
	fi
	if [ "$date_time" == "10-00-00-00" ] || [ "$date_time" == "10-30-00-00" ] || [ "$date_time" == "11-00-00-00" ] || [ "$date_time" == "11-30-00-00" ]
        then
	        echo "Generated"
                generateBackup
        fi
        if [ "$date_time" == "12-00-00-00" ] || [ "$date_time" == "12-30-00-00" ] || [ "$date_time" == "13-00-00-00" ] || [ "$date_time" == "13-30-00-00" ]
        then
                echo "Generated"
                generateBackup
        fi
        if [ "$date_time" == "14-00-00-00" ] || [ "$date_time" == "14-30-00-00" ] || [ "$date_time" == "15-00-00-00" ] || [ "$date_time" == "15-30-00-00" ]
        then
                echo "Generated"
                generateBackup
        fi
        if [ "$date_time" == "16-00-00-00" ] || [ "$date_time" == "16-30-00-00" ] || [ "$date_time" == "17-00-00-00" ] || [ "$date_time" == "17-30-00-00" ]
        then
                echo "Generated"
                generateBackup
        fi
        if [ "$date_time" == "18-00-00-00" ] || [ "$date_time" == "18-30-00-00" ]
       	then
                echo "Generated"
                generateBackup
        fi
done
