#!/bin/bash

case ${1,,} in
	obama | barrack)
		echo "Good morning mr. president."
		;;
	sadam | husein)
		echo "MR PRESIDENT GET DOWN"
		;;
	*)
		echo "Sir, you must leave the area"
	esac
