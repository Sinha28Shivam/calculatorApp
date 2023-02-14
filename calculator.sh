#/bin/bash

# We have started project on 14/02/2023

echo "Enter your name"
read name

echo "Hello! $name "

echo "Available mode of calculations"
echo "1. Normal calculation"
echo "2. Scientific calculation"


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
  read -p "Enter the operator (+ or -): " operator
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
*)
      echo "Invalid operator"
      ;;
  esac
}

# Main loop to read input from the user and perform calculations
while true; do
  read -p "Enter 'n' for normal calculation, 's' for scientific calculation, or 'q' to quit: " choice
  case $choice in
    "n")
      Normal_calculation
      ;;
    "s")
      read -p "Enter a scientific expression to calculate: " expr
      calculate "$expr"
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


