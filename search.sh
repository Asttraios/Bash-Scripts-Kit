#!/bin/bash

search_dir="$1"
second_dir="$2"

mkdir -p $second_dir

find $search_dir -type f -name "*.txt"	# FIND TXT FILES

find $search_dir -type l	# FIND SYMLINKS

find $search_dir -type f -name "*sh" -executable # FIND EXECUTABLE FILES THAT END WITH SH

find $search_dir -type d \( -iname "a*" -o -iname "d*" \)	# FIND FILES THAT START WITH A OR D 

find $search_dir -type f -empty -user user	# LOOK FOR EMPTY USER USER'S FILES 

find $search_dir -type f -group user -size +1M		# LOOK FOR FILES BIGGER THAN 1MB AND BELONG TO GROUP USER

find $search_dir -type f -mmin -60	# LOOK FOR FILES MODIFIED IN LAST 60 MINUTES

find $search_dir -type d -perm -1000	# LOOK FOR DIRECTORIES WITH STICKY BIT

find $search_dir -type f -executable -perm /u=s,g=s	# LOOK FOR EXECUTABLE FILES WITH SETUID AND SETGID

find /dev/ \( -type b -o -type c \)	# LOOK FOR BLOCK DEVICES - DISKS, USB AND FOR CHARACTER DEVICES - MICE, SPEAKER ETC

find $search_dir -type d -empty -exec rm -r {} \;	# DELETING EMPTY DIRECTORIES

find $search_dir -type f -size +10M -exec mv {} $second_dir \;	# MOVE FILES BIGGER THAN 10MB AND MOVE THEM TO SECOND_DIR DIRECTORY

find $search_dir -type d -name "Z*" -exec cp -r {} $second_dir \;	# COPY FILES WHICH NAME STARTS WITH Z TO SECOND_DIR DIRECTORY


