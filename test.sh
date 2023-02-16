#!/bin/bash

#clear screen
clear

#Welcome message
dialog --title "Welcome!" --msgbox "Welcome to Calculator" 20 50

#Asking for user's name
name=$(dialog --title "Name" --inputbox "Please enter your name:" 10 30 3>&1 1>&2 2>&3)
dialog --title "Name" --msgbox "Hello !  $name, welcome" 20 50

# add to history

calculate() {
  result=$(echo "$*" | bc -l)

  # timestamp
  ts=$(date +"%Y-%m-%d %H:%M:%S")
  echo "$*" = "$result performed on $ts" >> calculations.txt

  # display result in a dialog box
  dialog --title "Calculation Result" --msgbox "Result: $result" 8 40
}

# function to display the recent calculations
recent() {
  # load recent calculations from file
  if [[ -f calculations.txt ]]; 
  then
    result=$(cat calculations.txt)
  else
    result="No recent calculations found."
  fi

  # display recent calculations in a dialog box
  dialog --title "Recent Calculations" --msgbox "$result" 20 80
}

while true : 
do
#Displaying available modes of calculations
options=(1 "Normal Calculation"
         2 "Scientific Calculation"
         3 "Calculation History"
         4 "Exit")
        
choice=$(dialog --clear --title "Calculator" --menu "Please select a mode of calculation:" 15 50 4 "${options[@]}" 2>&1 >/dev/tty)

case $choice in
  1) #Normal Calculation
    operator_options=(1 "Addition"
                      2 "Subtraction"
                      3 "Multiplication"
                      4 "Division"
                      5 "Modulo(%)")

    operator=$(dialog --title "Normal Calculation" --menu "Please select an operator:" 15 50 6 "${operator_options[@]}" 2>&1 >/dev/tty)

    num1=$(dialog --title "Normal Calculation" --inputbox "Enter the first number:" 10 30 2>&1 >/dev/tty)
    num2=$(dialog --title "Normal Calculation" --inputbox "Enter the second number:" 10 30 2>&1 >/dev/tty)

    case $operator in
      1)
        result=$(echo "$num1 + $num2" | bc -l)
        ;;
      2)
        result=$(echo "$num1 - $num2" | bc -l)
        ;;
      3)
        result=$(echo "$num1 * $num2" | bc -l)
        ;;
      4)
        result=$(echo "$num1 / $num2" | bc -l)
        ;;
      5)
        result=$(echo "$num1 % $num2" | bc -l)
        ;;
      *)
        dialog --title "Error" --msgbox "Invalid operator" 20 50
        exit 1
        ;;
    esac

    #timestamp
   # ts=$(date +"%Y-%m-%d %H:%M:%S")
    addtohis="$num1 $operator $num2" "$result"
    dialog --title "Result" --msgbox "Result: $result" 20 500
    ;;

  2) # Scientific Calculation
    function_options=(1 "Trignometric Function"
                      2 "Currency Converter")

     function=$(dialog --title "Scientific Calculation" --menu "Please select a function:" 15 50 3 "${function_options[@]}" 2>&1 >/dev/tty)

     if [ $function -eq 1 ]; 
     then
      trig_options=(1 "sin"
                    2 "cos"
                    3 "tan")

      trig=$(dialog --title "Trignometric Function" --menu "Please select a trignometric function:" 15 50 4 "${trig_options[@]}" 2>&1 >/dev/tty)

      angle=$(dialog --title "Trignometric Function" --inputbox "Enter the angle (in radian):" 10 30 2>&1 >/dev/tty)
    case $trig in
     1)
      result=$(echo "s($angle)" | bc -l)
      dialog --title "Result" --msgbox "Result: $result" 10 30
      ;;
     2)
      result=$(echo "c($angle)" | bc -l)
      dialog --title "Result" --msgbox "Result: $result" 10 30
      ;;
     3)
      result=$(echo "s($angle)/c($angle)" | bc -l)
      dialog --title "Result" --msgbox "Result: $result" 10 30
      ;;
    
    esac
    fi
    ;;
  3) echo "Displaying the history"
    recent
    ;;

  4) #Exit
    break
    ;;
esac
done
