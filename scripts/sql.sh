#!/bin/bash
#sql script for backing up databases and zipping them


#sql backup user, user name and password for the mysql user you want to use this script
  DB_USER=""
  DB_PASSWD=""

#optimise tables and check

  mysqlcheck --user=$DB_USER --password=$DB_PASSWD --all-databases;

# sql to backup use the user for my sql and dumps the file to a tmp directory
  mysqldump --user=$DB_USER --password=$DB_PASSWD something > something.sql;

#the directories that you want to include
  backup_files="/files "

#save zip file else were on the server
  dest="/backups"

#Create archive file name
  day=$(date +%d)
  month=$(date +%b )
  year=$(date +%y)
  prefix="sql"

  archive_file="$prefix-$day-$month-$year.tgz"

#Print start status
  echo "Backing it all up $backup_files to $dest/$archive_file"
    date
  echo
    tar czf $dest/$archive_file $backup_files
  echo

# print end message
  echo "Backup complete : " date

#long listing of the files in dest
  ls -lh $dest

#remove all sql temp files
  rm *.sql

#mail out a report if running from the term window
#  echo "sql backup completed \n Date of Backup : $day $month $year \n Backed up : SQL \n Time of the backup : $(date) \n Backup location : $dest" | sendmail Backup blar@blar.co.uk

From: me@blar.co.uk
To: me@blar.co.uk
Subject: MIME Test

cat <<EOF
Mime-Version: 1.0
Content-Type: text/html

<!doctype html>
<html>
    <head>
    <meta charset='utf-8'>
    <title>Backups for sql complete</title>
      <style type='text/css'>
      /*styles to go here*/
      .main{width:100%;background:#000;}
      .heading{width:95%;background:#ddd;}
      .information{width:95%;background:#888;}
      </style>
    </head>
<body>
  <div class='main'>
    <div class='heading'>
      <h1>SQL optimised and backed up $day - $month - $year</h1>
        <div class='information'>
	dest: $dest
        </div>
    </div>
  </div>
</body>
</html>
EOF


