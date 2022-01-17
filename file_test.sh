#!/bin/bash
#-----------------signifies main topic----------------
#---signifies sub topic---
#NOTE: Bash is case sensative

practise_topic=$1 #to execute only a particular topic

if [ "$#" -eq 0 ]; then
	echo Enter argument from 1 to 4
fi

if [ "$practise_topic" -eq 1 ]; then
#-------------------Varibles trials and practise-----------------
sampledir=/home/vishalraj #setting the variable

ls $sampledir #referring the variable


#---using '' or "" make the script understand that the entity inside
#it is a single item
myvar='Hello world!' #every character will be treated seperately

newvar="More $myvar" #here using "" will substitute variables
echo $newvar

newvar='More $myvar' #using '' treats every letter literally
echo $newvar

#---command substitution - used for storing the command output in a
#---variable.
myvar=$(ls /home/vishalraj | wc -l)
echo There are $myvar files in the directory /home/vishalraj

#--variable scope and export to another script

var1=vishal
var2=raj 

echo $0 :: var1 : $var1, var2 :$var2

export var1 var2
./script2.sh 

echo $0 :: var1 : $var1, var2 :$var2

fi

if [ "$practise_topic" -eq 2 ]; then
#-------------------User Inputs-----------------

echo Please enter your name:
read name
echo Name Entered : $name

#---read command with different command line options:
read -p 'Username: ' username #-p provides prompt to the user
read -sp 'Password: ' password #-s makes the input silent(user input is invisible)

echo Entered username : $username \& password : $password

#--more no_of inputs

echo Enter your 3 fav cars:
read car1 car2 car3
echo Fav cars: $car1 $car2 $car3

fi

if [ "$practise_topic" -eq 3 ]; then
#-------------------Arithmatic-----------------

echo Enter a number of add of 10:
read num
let "a = $num + 10"
echo a : $a

result=$(expr $num + 20) #expression must have space in between
echo Addition with 20 using expr : $result

result=$(( $num * 2 )) #double paranthesis can be used to do arithmatic
echo Multiplication with 2 using \(\(\)\) : $result

length=${#result} #${#var} can be used to find the length of the var
echo length of result : $length

fi

if [ "$practise_topic" -eq 4 ]; then
#-------------------If and conditional-----------------

if [ $2 -gt 10 ]
then
	echo Number greater than 10

	if(($2 % 2 == 0))
	then
		echo The number is also even
	elif [ $2 -lt 20 ]
	then
		echo Number is odd and less than 20
	else
		echo The number is odd
	fi
fi

if [ $2 -gt 10 ] && [ $2 -lt 20 ] #can also use || Boolean operation
then
	echo Num is range\(10,20\)
else
	echo Num out of range
fi

#-eq is does a numerical comparison
#= does a string character by character comparison


#---case statements---

case $2 in #checking parameter using case 
	start)
		echo starting
		;;
	stop)
		echo stopping
		;;
	restart)
		echo restart
		;;
	*)					#default case
		echo default
		;;
esac

fi

if [ "$practise_topic" -eq 5 ]; then
#-------------------If and conditional-----------------

#---While loop---
counter=1

while [ $counter -le 10 ]
do
	echo $counter
	((counter++))
done

#both the above and below loop give the same output with
#different condition.

counter=1
#---Until loop---
until [ $counter -gt 10 ]
do
	echo $counter
	((counter++))
done

#---For loop---

names='Vishal Sanish Tanmay'

for name in $names
do
	echo $name
done

for i in {0..10..2} #use range for, for loop
do
	if [ $i -eq 6 ]
	then
		continue  #---continue statement, skips iteration---
	fi

	if [ $i -eq 10 ]
	then
		break  #---break statement---
	fi
	echo $i 
done

##---select---(menu system for selecting items in a list)

names='Vishal Sanish Tanmay quit'

PS3='Select name :' #sets custom prompt for select loop

select name in $names
do
	if [ $name == 'quit' ]
	then
		break
	fi
	echo Hello $name
done

fi