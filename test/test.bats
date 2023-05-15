#!/bin/bash

setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    # ... the remaining setup is unchanged

    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    # make executables in src/ visible to PATH
    PATH="$DIR/../src:$PATH"
}

#############################
# Helper functions
#############################

arg_with_single_word_file() {
    hyph.sh 'test.txt'
}

arg_with_multiple_single_space_separators() {
    hyph.sh 'test file with multiple spaces.txt'
}

arg_with_single_tab () {
    hyph.sh 'test   tab.txt'
}

arg_with_five_consecutive_spaces() {
    hyph.sh 'test     spaces.txt'
}

#############################
# Convert spaces to hyphens
#############################

@test "works correctly for single word file" {
    run arg_with_single_word_file
    assert_output 'test.txt'
}

@test "hyphenates multiple single space separators" {
    run arg_with_multiple_single_space_separators
    assert_output 'test-file-with-multiple-spaces.txt'
}

@test "hyphenates single tab" {
    run arg_with_single_tab
    assert_output 'test-tab.txt'
}

@test "hyphenates five consecutive spaces" {
    run arg_with_five_consecutive_spaces
    assert_output 'test-spaces.txt'
}

#############################
# Convert char x to char y
#############################

# TODO

#############################
# Change case
#############################

# TODO


