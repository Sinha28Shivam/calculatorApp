#!/bin/bash

# Define the TUI using dialog
dialog --title "Calculator" --backtitle "Simple calculator" \
--inputbox "Enter first number:" 8 40 2> /tmp/num1.txt

dialog --title "Calculator" --backtitle "Simple calculator" \
--inputbox "Enter second number:" 8 40 2> /tmp/num2.txt

num1=$(cat /tmp/num1.txt)
num2=$(cat /tmp/num2.txt)

# Perform the calculations
add=$(echo "$num1 + $num2" | bc)
sub=$(echo "$num1 - $num2" | bc)
mul=$(echo "$num1 * $num2" | bc)
div=$(echo "scale=2;$num1 / $num2" | bc)

# Display the results in a dialog box
dialog --title "Calculator" --backtitle "Simple calculator" \
--msgbox "Addition: $add\nSubtraction: $sub\nMultiplication: $mul\nDivision: $div" 12 50

# Clean up the temporary files
rm /tmp/num1.txt /tmp/num2.txt

