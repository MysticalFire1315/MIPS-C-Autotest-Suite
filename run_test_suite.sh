#!/usr/bin/env bash

# Declare the file paths
MY_FILE_PATH='./mipsc'
SOLUTION_PATH='1521 mipsc'

# Declare our colour codes
red="\e[0;31m"
green="\e[0;32m"
reset="\e[0m"

# Show that command is running
echo -e $reset"Running autotests for mipsc.c"

# First compile the file
echo 'dcc mipsc.c -o mipsc'
dcc mipsc.c -o mipsc

# Keep track of number of tests passed and failed
let num_tests=1
let num_passed=0
let num_failed=0

# Run through autotests
for test_file in $(find . -name "*hex"); do
    my_output=$($MY_FILE_PATH $test_file)
    reference_output=$($SOLUTION_PATH $test_file)

    if [ "$my_output" = "$reference_output" ]; then
        echo -e "Test $num_tests ($test_file $MY_FILE_PATH) -$green passed$reset"
        let num_passed++
    else
        echo -e "Test $num_tests ($test_file $MY_FILE_PATH) -$red failed$reset"
        echo "Your program did not match the reference solution here:"
        diff -h $my_output $reference_output
        let num_failed++
    fi
    let num_tests++

    my_output=$($MY_FILE_PATH -r $test_file)
    reference_output=$($SOLUTION_PATH -r $test_file)

    if [ "$my_output" = "$reference_output" ]; then
        echo -e "Test $num_tests ($test_file -r $MY_FILE_PATH) -$green passed$reset"
        let num_passed++
    else
        echo -e "Test $num_tests ($test_file -r $MY_FILE_PATH) -$red failed$reset"
        echo "Your program did not match the reference solution here:"
        diff -h $my_output $reference_output
        let num_failed++
    fi
    let num_tests++
done

if [ $num_failed = 0 ]; then
    echo -e "$green$num_passed tests passed $num_failed tests failed$reset"
elif [ $num_passed = 0 ]; then
    echo -e "$red$num_passed tests passed $num_failed tests failed$reset"
else
    echo -e "$green$num_passed tests passed $red$num_failed tests failed$reset"
fi

rm mipsc