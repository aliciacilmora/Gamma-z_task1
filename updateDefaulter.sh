#!/bin/bash

#to check if the students have paid the fee before the end of the semester

file=studentDetails.txt

while IFS=read -r line
do
  username=$(echo "$line" | cut -d ' ' -f1)
  hostel=$(echo "$line" | cut -d ' ' -f3)
  value=$( grep -i "Fee Paid" /home/"$username"/userDetails.txt)

  if [ $value -eq 1 ]
  then
      sudo touch ~/"$hostel"/.announce.txt
      echo "$username" > ~/"$hostel"/.announce.txt

  elif [ $value -eq 0 ]
  then
      echo "$username" > ~/"$hostel"/feeDefaulters.txt
  fi
done < "$file"
unset username


#adding the first five into announcements.txt
sudo head -5 ~/Agate/.announce.txt > ~/Agate/announcements.txt
sudo head -5 ~/GarnetB/.announce.txt > ~/GarnetB/announcements.txt
sudo head -5 ~/GarnetA/.announce.txt > ~/GarnetA/announcements.txt
sudo head -5 ~/Opal/.announce.txt > ~/Opal/announcements.txt
