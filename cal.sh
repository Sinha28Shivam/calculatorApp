#!/bin/bash

# Test the normal calculation
echo "Test: Normal calculation - addition"
actual=$(echo -e "1\n2\n1" | ./calculator.sh | grep "Result:" | awk '{print $2}')
expected="3"
if [[ "$actual" == "$expected" ]]; then
    echo "PASS"
else
    echo "FAIL"
fi

# Test the scientific calculation
echo "Test: Scientific calculation - sine"
actual=$(echo -e "2\nsin\n1" | ./calculator.sh | grep "Result:" | awk '{print $2}')
expected="0.84147098480789650665"
if [[ "$actual" == "$expected" ]]; then
    echo "PASS"
else
    echo "FAIL"
fi

# Test the recent calculation
echo "Test: Recent calculation"
actual=$(echo -e "3" | ./calculator.sh | grep "Recent Calculation" | wc -l)
expected="1"
if [[ "$actual" == "$expected" ]]; then
    echo "PASS"
else
    echo "FAIL"
fi

# Test the currency conversion
echo "Test: Currency conversion - EUR"
actual=$(echo -e "3\neur\n1" | ./calculator.sh | grep "Result:" | awk '{print $2}')
expected="2.52"
if [[ "$actual" == "$expected" ]]; then
    echo "PASS"
else
    echo "FAIL"
fi

# Test an invalid choice
echo "Test: Invalid choice"
actual=$(echo -e "4" | ./calculator.sh | grep "Invalid choice" | wc -l)
expected="1"
if [[ "$actual" == "$expected" ]]; then
    echo "PASS"
else
    echo "FAIL"
fi

