#!/usr/bin/env bats

@test "Check if the Perl-Script complies with perlcritic (as configured by ypid)" {
    echo "Try it with this configuration again: https://github.com/ypid/dotfiles/blob/master/.perlcriticrc"
    run type -a perlcritic
    [ "$status" -eq 0 ] || skip "Skipped because perlcritic is not in your $PATH. Please install it."
    run perlcritic ../check_hyperv_host
    echo $output
    [ "$output" = "../check_hyperv_host source OK" ]
    [ "$status" -eq 0 ]
}
