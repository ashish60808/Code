#!/bin/bash
#Test case for this rule:
# * Every 7th file ignores the previous two rules and contains the concatencated
#   contents of all of the previous files.
for i in {1..100} 
   do
   count_lines=`cat /tmp/files/file_$i.txt|wc -l`
if (([ `expr $i % 7 | bc` == 0  ])||([ `expr $i % 7 | bc` == 0  ] && [ `expr $i % 5 | bc` == 0  ]) &&   [ $count_lines -ge 6 ])
   then
      echo "file_$i.txt more than 6 lines"
fi
done

#Test case for this rule:
# * Each file should contain a line with between 1 and 65 randomly chosen
#   printable characters (both the number of the characters and the characters
#   themselves are random)

for i in {1..100}
   do
   count_chars=`cat /tmp/files/file_$i.txt|wc -c`
if ([ $count_chars -gt 0 ] &&   [ $count_chars -le 65 ]);
   then
      echo "File_$i.txt contains the random character between 1-65"
fi
done

#Test case for this rule:
# * Line "This is every 5th file!" should appear in every 5th file
string="This is every 5th file!"
for i in {1..100}
   do
   file_content=`cat /tmp/files/file_$i.txt`
    if (([ `expr $i % 5 | bc` == 0 ]) && ([ "$file_content" == "$string" ]));
       then
           echo "file_$i.txt contains --This is every 5th file!"
  
    fi
done

