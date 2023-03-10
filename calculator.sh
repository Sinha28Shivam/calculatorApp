#/bin/bash

# We have started project on 14/02/2023

#here we havw implemented the  clear command 
clear

echo -e " \033[1m\033[31m-----> Welcome! to Calculator <-----\033[0m "
#echo -e "\033[14t\033[31m\033[24m\033[38;5;220 ----> Welcome to Calculator <---- \033[0m"

echo "Enter your name"
read name

echo -e "Hello! \033[1m\033[31m$name\033[0m "

echo "Available mode of calculations"
echo -e "\e[32m1. Normal calculation\e[0m"
echo -e "\e[32m2. Scientific calculation\e[0m"
echo -e "\e[32m3. Recent calculations\e[0m"


# Function to calculate the result of an expression and store it in a text file
calculate() {
  result=$(echo "$*" | bc -l)


  #timestamp
  ts=$(date +"%Y-%m-%d %H:%M:%S")
  echo "$*" = "$result performed on $ts" >> calculations.txt
  echo "Result: $result"
}

#displaying the recent calculation
recent(){

	echo "Recent Calculation"
	for calculation in "${result[@]}";
	do
		echo "$calculation"
	done
	
}

# load recent calculations  from file
if [ -f calculations.txt ];
then
	while read -r line;
	do
		result+=("$line")
	done < calculations.txt
fi


Normal_calculation() {
	# read -p "Enter the choice: " operator
  echo "1. Addition"
  echo "2. Subtraction"
  echo "3. Multiplication"
  echo "4. Division"
  echo "5. Modulo(%)"
#  echo "6. Linear Equation"
  read -p "Enter the choice: " operator


  read -p "Enter the first number: " num1
  read -p "Enter the second number: " num2
  case $operator in
    "1")
      calculate "$num1 + $num2"
      
      ;;
    "2")
      calculate "$num1 - $num2"
      ;;
    "3")
      calculate "$num1 * $num2"
      ;;
     "4")
      calculate "$num1 / $num2"
      ;;
     "5")
      calculate "$num1 % $num2"
      ;;
        
*)
      echo "Invalid operator"
      ;;
  esac

	  

}


# Performing the  scientific calculation



	scientific_calculation() {
	echo "1. Trignometric Function"
	echo "2. Currency Converter"

	read -p "Enter the choice: " choice

	if [[ $choice == "1" ]];
	then
	read -p "Enter the trignometery function(sin, cos, tan): " func
	read -p "Enter the angle (in radian): " angle

	case $func in
		"sin")
			calculate "s($angle)"
			;;
		"cos")
			calculate "c($angle)"
			;;
		"tan")
			calculate "s($angle)/c($angle)"
			;;

		*)
			echo "Invalid function"
			;;
	esac


# function for currency converter
elif [[ $choice == "2" ]];
then
read -p "Enter the amount in USD: " usd
read -p "Enter the currency to convert to (EUR, GBP, JPY): " currency

case $currency in
	"EUR")
		calculate "$usd * 0.84"
		;;
	"GBP")
		calculate "$usd * 0.73"
		;;
	"JPY")
		calculate "$usd * 105.24"
		;;
	*)
		echo "Invalid currency"
		;;
esac
else 

	echo "Invalid choice"
fi
}

#while loop to read input from the user and perform calculations
while true; 
do
  read -p "Enter '1' for Normal Calculation, Enter '2' for Scientific Calculation, Enter '3' for see the history, 'q' to quit: " choice
  case $choice in
    "1")
      Normal_calculation
      ;;
    "2")
    scientific_calculation
      ;;
    "3")
    recent
    ;;
    "q")
      echo "Exiting..."
      exit 0
      ;;
    *)
      echo "Invalid choice"
      ;;
  esac
done


