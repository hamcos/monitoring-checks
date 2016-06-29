# Checks for Nagios/Icinga

This repository keeps track of the checks offered by [hamcos](http://www.hamcos.de).

These scripts where written for the [hamcos Monitoring appliance](http://www.hamcos.de/monitoring).

All scripts are Free Software. Enjoy.
In particular [GPL-2.0](https://spdx.org/licenses/GPL-2.0.html) has been chosen
allow the scripts to be included in the Check_MK if they wish to do so.

## check_incomingSMS
This plugin checks if there are SMS in the incoming directory. This can be useful if you only use the GSM modem for outgoing SMS and there is the slightest chances for incoming SMS. It can also be used to check if there are SMS in the outgoing directory.

[Monitoring Exchange](https://www.monitoringexchange.org/inventory/Check-Plugins/Hardware/Devices/Misc/check_incomingSMS)

## check_netapp_disks_zeroed
This plugin checks if there are spare disks which are not zeroed over the ZAPI from NetApp.
It depends on https://communities.netapp.com/docs/DOC-1152

[Monitoring Exchange](https://www.monitoringexchange.org/inventory/Check-Plugins/Hardware/Storage/NetApp/check_netapp_disks_zeroed)

## check_netapp_snapshot
Nagios/Icinga check for the snapshot age of a NetApp storage system.
Additionally, this check can also fed the number of snapshots per volume as
passive check into the core.
It depends on https://communities.netapp.com/docs/DOC-1152

## check_netapp_lun_status
This plugin checks if all LUNs are online.
It depends on https://communities.netapp.com/docs/DOC-1152

## check_netapp_interface_up
This plugin checks if all specified interfaces are up.
It depends on https://communities.netapp.com/docs/DOC-1152

## check_netapp_is_home_interface
This plugin checks if all systems use there home interface.
It depends on https://communities.netapp.com/docs/DOC-1152

[Monitoring Exchange](https://www.monitoringexchange.org/inventory/Check-Plugins/Hardware/Storage/NetApp/check_netapp_snapshot_age)

## check_netapp_snapmirror_lag_time
Checks NetApp SnapMirror volume lag time and healthiness.
It depends on https://communities.netapp.com/docs/DOC-1152
