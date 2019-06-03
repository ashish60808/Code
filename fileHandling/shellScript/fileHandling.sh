#!/bin/bash
#****************************** Problem Statement *****************************************
# ### Generate 100 files
# * Each file should contain a line with between 1 and 65 randomly chosen
#   printable characters (both the number of the characters and the characters
#   themselves are random)
# * Line "This is every 5th file!" should appear in every 5th file
# * Every 7th file ignores the previous two rules and contains the concatencated
#   contents of all of the previous files.
# * Write test-suite for your implementation.

#code starts from here
#Purging previous file if any
rm -rf /tmp/files/*.txt

for i in {1..100}
   do
   #Rule 3 handling
   if ([ `expr $i % 7 | bc` == 0  ])||([ `expr $i % 7 | bc` == 0  ] && [ `expr $i % 5 | bc` == 0  ]) 
   then
      for (( ii=1; ii < i; ii++ ))    
         do
            cat /tmp/files/file_$ii.txt >> /tmp/files/file_$i.txt
         done

#**********************Rule 2 handling**************************
elif [ `expr $i % 5 | bc` == 0 ] 
   then
      echo "This is every 5th file!" > /tmp/files/file_$i.txt

else #Rule 1 handling
   head -c $((1 + RANDOM % 65)) < /dev/urandom|base64 >/tmp/files/file_$i.txt 
fi
done