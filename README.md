# MIPS-C-Autotest-Suite

Autotest suite for `MIPS-C` (COMP1521 22T3 Assignment 2)

## How to use

Start by either cloning this repository or downloading it as a zip and unzipping it in the directory with your `mipsc.c` file.
Once you've done that, simply navigate to your working directory in the bash terminal and run the script with `bash MIPS-C-Autotest-Suite/run_test_suite.sh`.

You can also give the script execute permission by using `chmod +x MIPS-C-Autotest-Suite/run_test_suite.sh` to be able to run it with `./MIPS-C-Autotest-Suite/run_test_suite.sh`.

Please note that you should be on the CSE servers before attempting to run the script, as it requires access to the reference solution!

## Contents of Repo

- `run_test_suite.sh` is the bash script to execute, which will use all the `.hex` files found recursively in your working directory as input to the `mipsc` program.
- `tests/` is a directory containing the test cases.
  - Each test case is a `.hex` file containing the inputs to the program.

## Notes

If you have suggestions for more test cases, please ping (in the CSESOC #1521 channel) or DM me on discord!
My discord handle is MysticalFire#2217.

## Changelog

### 8 November 2022

- Created repo and added initial test cases.
