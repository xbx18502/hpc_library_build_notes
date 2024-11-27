
# check all disk
diskutil list
# resize the partition in macos
diskutil partitionDisk /dev/disk2 GPT APFS "MyAPFS" 500G exFAT "MyExFAT" R
