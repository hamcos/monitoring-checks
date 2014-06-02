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
This plugin checks if there is a snapshot newer than one day. The age in days can be adopted with the fourth parameter.
It depends on https://communities.netapp.com/docs/DOC-1152

[Monitoring Exchange](https://www.monitoringexchange.org/inventory/Check-Plugins/Hardware/Storage/NetApp/check_netapp_snapshot_age)
