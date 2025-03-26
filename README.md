# Overview
This is a set of my bash scripts I've made for Operational Systems classes back in the day.

# How do they work?
### bubble_sort.sh
- Implements Bubble Sort algorithm
- **bash bubble_sort.sh {space-devided numbers}** - Example: bash bubble_sort.sh 2 5 6 -4 2 6 7

### trapezoidal_rule.sh
- Implements Trapezoidal rule - to calculate integral
- **bash trapezoidal_rule.sh {space-devided function values}** - Example: bash trapezoidal_rule.sh 19 24 29 31

### fileManager.sh
- Create or delete a file
- Create or delete a directory
- Usage: **bash fileManager.sh**

### fileOperations.sh
- Randomly distributes lines from one file between two other files
- Then creates 10 files in subdirectories provided in the list
- **bash fileOperations.sh {arguments}**

### factorial.sh
- Implements both iterative and recursive factorial
- **bash factorial.sh {natural number}**

### fileStats.sh
- Counts word occurences
- Results are saved in seperate file, in the same directory you run command
- **bash fileStats.sh {file to analyze} {file with results}**

### multiplication_table.sh
- Creates multiplication table
- **bash mutliplication_table.sh {number of rows} {number of columns}**

### links.sh
- Creates new directory
- Creates subdirectories and empty text file in every one of them
- Creates symlink to /etc/passwd/ in D1 directory
- Shows the real path of the symlink - /etc/passwd
- Changes files permission
- Creates sticky bit
- **bash links.sh {name of the directory to be creaated}**

### search.sh
- Searches for various types of files
- Moves files bigger than 10MB to another directory created by a script
- Copies files which name starts with Z to another directory created by a script
- **bash search.sh {directory which will be searched} {new directory to copy to}**


### fileAnalysis.sh
- Shows type of a file
- Shows number of lines in a file
- shows file's size
- Counts the occurrences of a specific keyword in a text file
- Count the number of lines that don't contain the keyword
- Displays 5th line of the file
- **bash fileAnalysis.sh {analyzed file} {keyword to search for}**

