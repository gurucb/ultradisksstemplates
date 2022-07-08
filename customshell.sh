#!/bin/bash
echo $HOME

#sudo apt-get -y -q=2 install jq

# cat /etc/fstab | grep "VolGroup00\|iris01vg"
# if [[ ${?}  -ne  0 ]]; then
# curl -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2020-06-01" | jq > irisMetadata.txt
# vm_gen=$(cat irisMetadata.txt |jq .compute.vmSize |tr -d '"' |awk -F_ '{print $3}')

        # if [[ $vm_gen -eq v4 ]]; then
            # BLACKLIST="/dev/sda"
        # else
        BLACKLIST="/dev/sda|/dev/sdb"
        # # fi

# scan_for_new_disks() {
    # Looks for unpartitioned disks
     DISKS=[$(ls /dev/sd*|egrep -v '[0-9]$')]
# }
# DISKS=$(scan_for_new_disks)

        for DISKS in "${DISKS[@]}";
        do
                echo "Checking for disk ${DISKS}"
                isFormatted=$(lsblk -no KNAME,FSTYPE ${DISKS} |wc -w)
                if [[ ${isFormatted} -eq 1 ]];
                then
                        echo "Drive ${DISKS} is NOT FORMATTED"
        #                 mkdir /ultratestdrive
        #                 mkfs.xfs -b size=4096 ${DISKS}
        #                 mount ${DISKS} /ultratestdrive

                else
        #                 echo "DRIVE ${disk} is FORMATTED"
                fi


        done

# fi