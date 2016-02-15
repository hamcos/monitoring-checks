#!/usr/bin/env bats

@test "Error checking" {
    run ../check_hyperv_host -C cpu-usage --type check_nt -- ../non-existing
    [ "$status" -eq 3 ]
    run ../check_hyperv_host -C cpu-usage --type check_nt -- ../fake_get_counter "test" "" 0
    [ "$status" -eq 3 ]
    run ../check_hyperv_host -C cpu-usage --type check_nt -- ../fake_get_counter 23 "" 1
    [ "$status" -eq 3 ]
    run ../check_hyperv_host -C cpu-usage --type check_nt -- ../fake_get_counter 23 "error" 0
    [ "$status" -eq 3 ]
    run ../check_hyperv_host -C not-existing-check --type check_nt -- ../fake_get_counter 23 "" 0
    [ "$status" -eq 3 ]
}

@test "Check CPU usage" {
    run ../check_hyperv_host -C cpu-usage --type check_nrpe -- ../fake_get_counter "OK: \Hyper-V Hypervisor Logical Processor(_Total)\% Total Run Time: 7.00425|'\Hyper-V Hypervisor Logical Processor(_Total)\% Total Run Time'=7.0042520039850489" "" 0
    [ "$status" -eq 0 ]
    [ "$output" = 'HYPERV OK - 7 % (Average utilization of all CPU cores) ([Minimum:]Warning/Critical[:Maximum] at: 0:60/90:100) | cpu-usage=7.00425%;60;90;0;100' ]
    run ../check_hyperv_host -C cpu-usage --type check_nt -- ../fake_get_counter 23 "" 0
    [ "$status" -eq 0 ]
    [ "${lines[0]}" = 'HYPERV OK - 23 % (Average utilization of all CPU cores) ([Minimum:]Warning/Critical[:Maximum] at: 0:60/90:100) | cpu-usage=23' ]
    [ "${lines[1]}" = '%;60;90;0;100' ]
    run ../check_hyperv_host -C cpu-usage --type check_nt -- ../fake_get_counter 60 "" 0
    [ "$status" -eq 0 ]
    run ../check_hyperv_host -C cpu-usage --type check_nt -- ../fake_get_counter 61 "" 0
    [ "$status" -eq 1 ]
    run ../check_hyperv_host -C cpu-usage -w 65 --type check_nt -- ../fake_get_counter 61 "" 0
    [ "$status" -eq 0 ]
    run ../check_hyperv_host -C cpu-usage --type check_nt -- ../fake_get_counter 90 "" 0
    [ "$status" -eq 1 ]
    run ../check_hyperv_host -C cpu-usage --type check_nt -- ../fake_get_counter 91 "" 0
    [ "$status" -eq 2 ]
    run ../check_hyperv_host -C cpu-usage --type check_nt -- ../fake_get_counter 100 "" 0
    [ "$status" -eq 2 ]
    run ../check_hyperv_host -C cpu-usage --type check_nt -- ../fake_get_counter 101 "" 0
    [ "$status" -eq 3 ]
    run ../check_hyperv_host -C cpu-usage --type check_nt -- ../fake_get_counter -1 "" 0
    [ "$status" -eq 3 ]
}

@test "Check VM health critical" {
    run ../check_hyperv_host -C vm-health-critical --type check_nt -- ../fake_get_counter 0 "" 0
    [ "$status" -eq 0 ]
    run ../check_hyperv_host -C vm-health-critical --type check_nt -- ../fake_get_counter 1 "" 0
    [ "$status" -eq 1 ]
    run ../check_hyperv_host -C vm-health-critical --type check_nt -- ../fake_get_counter 2 "" 0
    [ "$status" -eq 2 ]
    run ../check_hyperv_host -C vm-health-critical --type check_nt -- ../fake_get_counter -1 "" 0
    [ "$status" -eq 3 ]
}

@test "Check VM health ok (no upper critical/max limit)" {
    run ../check_hyperv_host -C vm-health-ok --type check_nt -- ../fake_get_counter 5 "" 0
    [ "$status" -eq 0 ]
    run ../check_hyperv_host -C vm-health-ok --type check_nt -- ../fake_get_counter 1000 "" 0
    [ "$status" -eq 0 ]
    run ../check_hyperv_host -C vm-health-ok --type check_nt -- ../fake_get_counter 1001 "" 0
    [ "$status" -eq 1 ]
    run ../check_hyperv_host -C vm-health-ok --type check_nt -- ../fake_get_counter 100100000000000000 "" 0
    [ "$status" -eq 1 ]
}
