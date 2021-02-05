#!/bin/bash

queryNo=0

while [ $queryNo -lt 1000 ]
do
 let queryNo=queryNo+1

 name=$(nl datas | grep -w $queryNo | awk '{print $2}' | awk -F ',' '{print $1}')
 lastname=$(nl datas | grep -w $queryNo | awk '{print $2}' | awk -F ',' '{print $2}')
 email=$(nl datas | grep -w $queryNo | awk '{print $2}' | awk -F ',' '{print $3}')
 gender=$(nl datas | grep -w $queryNo | awk '{print $2}' | awk -F ',' '{print $4}')
 mysql -u root -padmin random_datas -e "insert into random_datas values ('$counter', '$name', '$lastname', '$email', '$gender');"
 echo "$counter, $name $lastname, $email, $gender was correctly imported"
done

