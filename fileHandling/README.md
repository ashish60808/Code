## Exercises 1
### Generate 100 files
* Each file should contain a line with between 1 and 65 randomly chosen
  printable characters (both the number of the characters and the characters
  themselves are random)
* Line "This is every 5th file!" should appear in every 5th file
* Every 7th file ignores the previous two rules and contains the concatencated
  contents of all of the previous files.
* Write test-suite for your implementation.

I have created the two solution 1 is using go language code a bd second one is using the Shell scripts.
## Solution 1: go-lang code
### How to run go code.
* .  go run filehandling.go
above command will create the 100 files in current directory with names file_1.txt,file_3.txt.....file_100.txt

# Solution 1: Bash shell script
### How to run shell script.
* .  chmod 766 && ./filehandling.sh
above command will create the 100 files in /tmp/files  directory with names file_1.txt,file_3.txt.....file_100.txt
