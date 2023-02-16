# /bin/usr/env bats

#!/usr/bin/env bats

@test "Normal addition calculation" {
  result=$(./calculator.sh <<< $'1\n2\n3\n')
  [ "$result" == "Result: 5" ]
}

@test "Normal subtraction calculation" {
  result=$(./calculator.sh <<< $'2\n5\n3\n')
  [ "$result" == "Result: 2" ]
}

@test "Normal multiplication calculation" {
  result=$(./calculator.sh <<< $'3\n6\n4\n')
  [ "$result" == "Result: 24" ]
}

@test "Normal division calculation" {
  result=$(./calculator.sh <<< $'4\n15\n3\n')
  [ "$result" == "Result: 5" ]
}

@test "Normal modulo calculation" {
  result=$(./calculator.sh <<< $'5\n10\n3\n')
  [ "$result" == "Result: 1" ]
}

@test "Scientific sin calculation" {
  result=$(./calculator.sh <<< $'2\nsin\n1\n')
  [ "$result" == "Result: .84" ]
}

@test "Scientific cos calculation" {
  result=$(./calculator.sh <<< $'2\ncos\n1\n')
  [ "$result" == "Result: .54" ]
}

@test "Scientific tan calculation" {
  result=$(./calculator.sh <<< $'2\ntan\n1\n')
  [ "$result" == "Result: 1.56" ]
}

@test "Currency conversion to EUR" {
  result=$(./calculator.sh <<< $'6\n10\nEUR\n')
  [ "$result" == "Result: 8.4" ]
}

@test "Currency conversion to GBP" {
  result=$(./calculator.sh <<< $'6\n10\nGBP\n')
  [ "$result" == "Result: 7.3" ]
}

@test "Currency conversion to JPY" {
  result=$(./calculator.sh <<< $'6\n10\nJPY\n')
  [ "$result" == "Result: 1052.4" ]
}

@test "Recent calculations" {
  result=$(./calculator.sh <<< $'3\n')
  [ "$result" == "Recent Calculation" ]
}


