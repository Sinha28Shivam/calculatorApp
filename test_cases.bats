# /bin/usr/env bats

#!/usr/bin/env bats


#!/usr/bin/env bats

# Test the calculator program

@test "test normal addition" {
  result=$(echo "2 + 3" | ./calculator.sh)
  [ "$result" = "Result: 5" ]
}

@test "test normal subtraction" {
  result=$(echo "10 - 7" | ./calculator.sh)
  [ "$result" = "Result: 3" ]
}

@test "test normal multiplication" {
  result=$(echo "2 * 3.5" | ./calculator.sh)
  [ "$result" = "Result: 7.00000000000000000000" ]
}

@test "test normal division" {
  result=$(echo "15 / 3" | ./calculator.sh)
  [ "$result" = "Result: 5" ]
}

@test "test normal modulo" {
  result=$(echo "15 % 4" | ./calculator.sh)
  [ "$result" = "Result: 3" ]
}

@test "test scientific sin" {
  result=$(echo "2" | ./calculator.sh <<-EOF
2
sin
1.047
EOF
)
  [ "$result" = "Result: 0.87947375120648925622" ]
}

@test "test scientific cos" {
  result=$(echo "2" | ./calculator.sh <<-EOF
2
cos
1.047
EOF
)
  [ "$result" = "Result: 0.47553692799599283037" ]
}

@test "test scientific tan" {
  result=$(echo "2" | ./calculator.sh <<-EOF
2
tan
1.047
EOF
)
  [ "$result" = "Result: 1.84625209838539000420" ]
}

@test "test currency conversion to EUR" {
  result=$(echo "2" | ./calculator.sh <<-EOF
2
EUR
30
EOF
)
  [ "$result" = "Result: 25.20000000000000000000" ]
}

@test "test currency conversion to GBP" {
  result=$(echo "2" | ./calculator.sh <<-EOF
2
GBP
30
EOF
)
  [ "$result" = "Result: 21.90000000000000000000" ]
}

@test "test currency conversion to JPY" {
  result=$(echo "2" | ./calculator.sh <<-EOF
2
JPY
30
EOF
)
  [ "$result" = "Result: 3157.20000000000000000000" ]
}



