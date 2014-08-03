#!/bin/bash

#Backup files and directory script @author James Mcavady 2014

# dirs to backup
  backup_files="/www /sites-enabled /sites-available"
#save zip file else were on the server, where <USERNAME> is your user name.
  dest="/home/<USERNAME>/backups"
#Create archive file name
  day=$(date +%d)
  month=$(date +%b )
  year=$(date +%y)

# Set your www directory
  prefix=""

# Set the file names for the zip with the $prefix and the day month then year
  archive_file="$prefix-$day-$month-$year.tgz"
#Print start status
  echo "Backing it all up $backup_files to $dest/$archive_file"
    date
  echo
    tar czf $dest/$archive_file $backup_files
  echo
# print end message
  echo "backup complete : " date
#long listing of the files in dest
  ls -lh $dest
#mail out a report and mail (sendMail only works if the user is logged and runs the script, run perms I think)
  echo "www backup completed \n Date of Backup : $day $month $year \n Dirs backed up : $backup_files \n Time of the backup : $(date) \n Backup location : $dest" | sendmail Backup blar@blar.co.uk
