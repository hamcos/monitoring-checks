# Checks for Nagios or Icinga

This repository keeps track of the checks offered by [hamcos](http://www.hamcos.de).

## check_incomingSMS
This plugin checks if there are SMS in the incoming directory. This can be useful if you only use the GSM modem for outgoing SMS and there is the slightest chances for incoming SMS. It can also be used to check if there are SMS in the outgoing directory.

[Monitoring Exchange](https://www.monitoringexchange.org/inventory/Check-Plugins/Hardware/Devices/Misc/check_incomingSMS)

## check_netapp_disks_zeroed
This plugin checks if there are disks which are not zeroed over the ZAPI from NetApp.
It depends on https://communities.netapp.com/docs/DOC-1152

[Monitoring Exchange](https://www.monitoringexchange.org/inventory/Check-Plugins/Hardware/Storage/NetApp/check_netapp_disks_zeroed)

## check_netapp_snapshot_age
This plugin checks if there are snapshot older than one day. The age in days can be adopted with the fourth parameter.
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
