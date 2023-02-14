#/bin/bash

# We have started project on 14/02/2023

echo -e " \033[1m\033[31m-----> Welcome! to Calculator <-----\033[0m "
#echo -e "\033[14t\033[31m\033[24m\033[38;5;220 ----> Welcome to Calculator <---- \033[0m"

echo "Enter your name"
read name

echo -e "Hello! \033[1m\033[31m$name\033[0m "

echo "Available mode of calculations"
echo -e "\e[32m1. Normal calculation\e[0m"
echo -e "\e[32m2. Scientific calculation\e[0m"


# Function to calculate the result of an expression and store it in a text file
calculate() {
  result=$(echo "$*" | bc -l)
  echo "$*" = "$result" >> calculations.txt
  echo "Result: $result"
}

# Main loop to read input from the user and perform calculations
#while true; do
#  read -p "Enter an expression to calculate: " expr
#  case $expr in
#    "quit" | "exit")
#      echo "Exiting..."
#      exit 0
 #     ;;
 #   *)
#      calculate "$expr"
#      ;;
#  esac
#done



Normal_calculation() {
  read -p "Enter the first number: " num1
  read -p "Enter the operator(+ or - or / or % or *): " operator
  read -p "Enter the second number: " num2
  case $operator in
    "+")
      calculate "$num1 + $num2"
      ;;
    "-")
      calculate "$num1 - $num2"
      ;;
    "/")
      calculate "$num1 / $num2"
      ;;
      "*")
      calculate "$num1 * $num2"
      ;;
      "%")
      calculate "$num1 % $num2"
      ;;


*)
      echo "Invalid operator"
      ;;
  esac
}

#scientific_calculation() {
# first define the angle

#read  "Enter angle in radian: " angle

#case $angle in
#	"sin")
#		result=$(echo "s($angle)" | bc -l);;
	
#		*)
#		echo "Invalid operator"
#		;;
#esac
#echo "$angle = $result"

#}
#scientific_calculation "sin"

#read -p  "Enter an angle" angle

#calculate_trig() {
 # case $angle in
#
#    "sin")
#	    result=$(echo "s($angle)" | bc -l)
#	    ;;
#    "cos") 
#	    result=$(echo "c($angle)" | bc -l)
#	    ;;
#    "tan") 
#	    result=$(echo "s($angle)/c($angle)" | bc -l)
#	    ;;
#   "cot") 
#	    result=$(echo "c($angle)/s($angle)" | bc -l)
#	    ;;
#    "sec") 
#	    result=$(echo "1/c($angle)" | bc -l)
#	    ;;
#   "csc") 
#	    result=$(echo "1/s($angle)" | bc -l)
#	    ;;
#    *)
#	    echo "Invalid function: " 
#	    ;;
#  esac
#  echo "($angle) = $result"
#}

# Calculate the trigonometric functions using the function
#calculate_trig "sin"
#calculate_trig "cos"
#calculate_trig "tan"
#calculate_trig "cot"
#calculate_trig "sec"
#calculate_trig "csc"

# Main loop to read input from the user and perform calculations
while true; do
  read -p "Enter '1' for Normal Calculation, Enter '2' for Scientific Calculation, or 'q' to quit: " choice
  case $choice in
    "1")
      Normal_calculation
      ;;
    "2")
     calculate_trig
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


