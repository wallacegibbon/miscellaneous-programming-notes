# Logical Volume Manager (LVM)

References:
- <https://www.tecmint.com/extend-and-reduce-lvms-in-linux/>
- <https://stackoverflow.com/a/26320277>

Current disk layout:

```
   Device Boot      Start         End      Blocks   Id  System
/dev/vdc1   *        2048     2099199     1048576   83  Linux
/dev/vdc2         2099200  1048575999   523238400   8e  Linux LVM
/dev/vdc3      1048576000  5242879999  2097152000   8e  Linux LVM
```

## Commands To Use:

- `pvs` - Display information about physical volumes
- `vgs` - Display information about volume groups
- `lvs` - Display information about logical volumes
- `pvdisplay` - Display various attributes of physical volume(s)
- `vgdisplay` - Display volume group information
- `lvdisplay` - Display information about a logical volume
- `pvcreate` - Initialize physical volume(s) for use by LVM
- `vgextend` - Add physical volumes to a volume group
- `lvextend` - Add space to a logical volume
- `resize2fs` - ext2/ext3/ext4 file system resizer
- `xfs_growfs` - expand an XFS filesystem

## Steps To Extend Volume

First, we initialize the `/dev/vdc3` as a physical volume.

```
$ pvcreate /dev/vdc3

  Physical volume "/dev/vdc3" successfully created.
```

```
$ pvs

  PV         VG     Fmt  Attr PSize    PFree
  /dev/vdc2  centos lvm2 a--  <499.00g 4.00m
  /dev/vdc3         lvm2 ---     1.95t 1.95t
```

Then we add it to volume group `centos`:

```
$ vgextend centos /dev/vdc3

  Volume group "centos" successfully extended
```

```
$ pvs

  PV         VG     Fmt  Attr PSize    PFree
  /dev/vdc2  centos lvm2 a--  <499.00g 4.00m
  /dev/vdc3  centos lvm2 a--     1.95t 1.95t
```

Now we extend the `/dev/centos/home` by allocating more space for it from volume group `centos`.

> The `Free PE` field from the output of `vgdisplay` command will tell you the size you can allocate.

```
$ vgdisplay

  --- Volume group ---
  VG Name               centos
  System ID
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  5
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                3
  Open LV               3
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               2.44 TiB
  PE Size               4.00 MiB
  Total PE              639742
  Alloc PE / Size       127742 / 498.99 GiB
  Free  PE / Size       512000 / 1.95 TiB
  VG UUID               8iphYa-Npjj-zJMf-7583-FQE2-xoHw-i4mqzr
```

```
$ lvextend -l +512000 /dev/centos/home

  Size of logical volume centos/home changed from 433.24 GiB (110910 extents) to <2.38 TiB (622910 extents).
  Logical volume centos/home successfully resized.
```

```
$ xfs_growfs /dev/centos/home

meta-data=/dev/mapper/centos-home isize=512    agcount=4, agsize=28392960 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=0 spinodes=0
data     =                       bsize=4096   blocks=113571840, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal               bsize=4096   blocks=55455, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
data blocks changed from 113571840 to 637859840
```

Done.