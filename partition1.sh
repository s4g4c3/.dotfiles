mkfs.vfat -F 32 /dev/nvme0n1p5 && \
mkswap /dev/nvme0n1p6 && \
mkfs.btrfs /dev/nvme0n1p7 
