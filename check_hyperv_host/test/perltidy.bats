#!/usr/bin/env bats

@test "Check if the Perl-Script is formated as perltidy suggests it (as configured by ypid)" {
    echo "Try it with this configuration again: https://github.com/ypid/dotfiles/blob/master/.perltidyrc"
    run type -a perltidy
    [ "$status" -eq 0 ] || skip "Skipped because perltidy is not in your $PATH. Please install it."
    run perltidy ../check_hyperv_host --outfile ./build/check_hyperv_host
    [ "$status" -eq 0 ]
    [ "$output" = "" ] || [ "$output" = "Ignoring -b; you may not use -b and -o together" ]
    diff ../check_hyperv_host ./build/check_hyperv_host
}

setup() {
    mkdir -p build
}

teardown() {
    rm -rf build
}
