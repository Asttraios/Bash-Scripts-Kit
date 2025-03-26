#!/bin/bash

showtime() {
	#local time=$(uptime) 
	#echo "Your time: $time"
	echo "Choose an option: "
	echo "1. create an empty file "
	echo "2. create a directory "
	echo "3. remove specified file "
	echo "4. remove specified directory recursively"
	
	read decision

	case $decision in
		1)
			echo "File name:"
			read file
			if [ -f "$file" ] || [ -d "$file" ]; then
				echo "File or directory with the same name already exists"
			else
				touch $file
				echo "You've just created empty file!"
			fi
			;;
		2)
			echo "Directory name:"
			read directory
			if [ -d "$directory" ] || [ -f "$file" ]; then
				echo "File or directory with the same name already exists"
			else
				mkdir $directory
				echo "You've just created empty directory!"
			fi
			;;
		3)
			echo "File name:"
			read file
			if [ -f "$file" ]; then
				rm $file
				echo "You've just removed a file!"			
			else
				echo "There is no such a file!"
			fi
			;;
		4)
			echo "Directory name:"
			read directory
			if [ -d "$directory" ]; then
				rm -d $directory
				echo "You've just removed a directory!"			
			else
				echo "There is no such a directory!"
			fi
			;;
		*)
			echo "You've chosen wrong option"
			;;
	esac

	}
showtime
