# Buildroot ARM64 with Rclone for QEMU

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
一个预配置好的ARM64 Linux系统，包含rclone云存储客户端，可在QEMU虚拟机中运行。谷歌云盘连接[![Google Drive](https://drive.google.com/file/d/1WZstW354Ikp4FgbJBsSXc5CZPDNwh3kN/view?usp=drive_link)

## 使用方法

- 安装qemu和buildroot
  '''
  #qemu
  #Additional information can also be found online via the QEMU website [WIKI](https://wiki.qemu.org/Hosts/Linux)
  git clone https://gitlab.com/qemu-project/qemu.git
  cd qemu
  mkdir build
  cd build
  ../configure qemu-aarch
  make qemu-system-aarch64 #仅安装arm64的qemu

  #buildroot
  git clone https://gitlab.com/buildroot.org/buildroot.git
  cd buildroot
  make qemu_aarch64_virt_defconfig #设置arm64的系统

  make #编译整个系统
  '''
- qemu中添加rclone包
  '''
  cd ~/buildroot/package #使用qemu的包管理器
  vim Config.in
  #在Config.in中添加source "package/rclone/Config.in"
  
  创建rclone文件
  touch Config.in rclone.mk
  #复制git中的Config.in和rclone.mk

  make menuconfig 在package中勾选rclone
  make rclone
  make qemu
  make #完成rclone在arm64系统中的安装 
  '''

## 📸 qemu中rclone结果
'''
Booting Linux on physical CPU 0x0000000000 [0x410fd034]
Linux version 6.12.47 (esp@DESKTOP-ILRNJJ3) (aarch64-buildroot-linux-gnu-gcc.br_real (Buildroot 2025.11-875-g898677d8b3-dirty) 14.3.0, GNU ld (GNU Binutils) 2.44) #1 SMP Wed Jan  7 19:52:29 CST 2026
random: crng init done
Machine model: linux,dummy-virt
efi: UEFI not found.
OF: reserved mem: Reserved memory: No reserved-memory node in the DT
Zone ranges:
  DMA      [mem 0x0000000040000000-0x0000000047ffffff]
  DMA32    empty
  Normal   empty
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000040000000-0x0000000047ffffff]
Initmem setup node 0 [mem 0x0000000040000000-0x0000000047ffffff]
psci: probing for conduit method from DT.
psci: PSCIv1.1 detected in firmware.
psci: Using standard PSCI v0.2 function IDs
psci: Trusted OS migration not required
psci: SMC Calling Convention v1.0
percpu: Embedded 20 pages/cpu s44184 r8192 d29544 u81920
pcpu-alloc: s44184 r8192 d29544 u81920 alloc=20*4096
pcpu-alloc: [0] 0
Detected VIPT I-cache on CPU0
CPU features: detected: ARM erratum 845719
alternatives: applying boot alternatives
Kernel command line: rootwait root=/dev/vda console=ttyAMA0
Dentry cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes, linear)
Built 1 zonelists, mobility grouping on.  Total pages: 32768
mem auto-init: stack:all(zero), heap alloc:off, heap free:off
software IO TLB: SWIOTLB bounce buffer size adjusted to 0MB
software IO TLB: area num 1.
software IO TLB: mapped [mem 0x0000000047f1d000-0x0000000047f5d000] (0MB)
SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
rcu: Hierarchical RCU implementation.
rcu:    RCU restricting CPUs from NR_CPUS=512 to nr_cpu_ids=1.
rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1
NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
Root IRQ handler: gic_handle_irq
GICv2m: range[mem 0x08020000-0x08020fff], SPI[80:143]
rcu: srcu_init: Setting srcu_struct sizes based on contention.
arch_timer: cp15 timer(s) running at 62.50MHz (virt).
clocksource: arch_sys_counter: mask: 0x1ffffffffffffff max_cycles: 0x1cd42e208c, max_idle_ns: 881590405314 ns
sched_clock: 57 bits at 63MHz, resolution 16ns, wraps every 4398046511096ns
Console: colour dummy device 80x25
Calibrating delay loop (skipped), value calculated using timer frequency.. 125.00 BogoMIPS (lpj=250000)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
Mountpoint-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
cacheinfo: Unable to detect cache hierarchy for CPU 0
rcu: Hierarchical SRCU implementation.
rcu:    Max phase no-delay instances is 1000.
EFI services will not be available.
smp: Bringing up secondary CPUs ...
smp: Brought up 1 node, 1 CPU
SMP: Total of 1 processors activated.
CPU: All CPU(s) started at EL1
CPU features: detected: 32-bit EL0 Support
CPU features: detected: CRC32 instructions
alternatives: applying system-wide alternatives
Memory: 113208K/131072K available (8192K kernel code, 882K rwdata, 1964K rodata, 1152K init, 576K bss, 16904K reserved, 0K cma-reserved)
devtmpfs: initialized
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
futex hash table entries: 256 (order: 2, 16384 bytes, linear)
29520 pages in range for non-PLT usage
521040 pages in range for PLT usage
DMI not present or invalid.
NET: Registered PF_NETLINK/PF_ROUTE protocol family
DMA: preallocated 128 KiB GFP_KERNEL pool for atomic allocations
DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
thermal_sys: Registered thermal governor 'step_wise'
cpuidle: using governor menu
hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
ASID allocator initialised with 65536 entries
Serial: AMBA PL011 UART driver
9000000.pl011: ttyAMA0 at MMIO 0x9000000 (irq = 13, base_baud = 0) is a PL011 rev1
printk: legacy console [ttyAMA0] enabled
ACPI: Interpreter disabled.
iommu: Default domain type: Translated
iommu: DMA domain TLB invalidation policy: strict mode
SCSI subsystem initialized
libata version 3.00 loaded.
pps_core: LinuxPPS API ver. 1 registered
pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
PTP clock support registered
vgaarb: loaded
clocksource: Switched to clocksource arch_sys_counter
pnp: PnP ACPI: disabled
NET: Registered PF_INET protocol family
IP idents hash table entries: 2048 (order: 2, 16384 bytes, linear)
tcp_listen_portaddr_hash hash table entries: 256 (order: 0, 4096 bytes, linear)
Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
TCP established hash table entries: 1024 (order: 1, 8192 bytes, linear)
TCP bind hash table entries: 1024 (order: 3, 32768 bytes, linear)
TCP: Hash tables configured (established 1024 bind 1024)
UDP hash table entries: 256 (order: 1, 8192 bytes, linear)
UDP-Lite hash table entries: 256 (order: 1, 8192 bytes, linear)
NET: Registered PF_UNIX/PF_LOCAL protocol family
PCI: CLS 0 bytes, default 64
workingset: timestamp_bits=46 max_order=15 bucket_order=0
fuse: init (API version 7.41)
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 249)
io scheduler mq-deadline registered
io scheduler kyber registered
pci-host-generic 4010000000.pcie: host bridge /pcie@10000000 ranges:
pci-host-generic 4010000000.pcie:       IO 0x003eff0000..0x003effffff -> 0x0000000000
pci-host-generic 4010000000.pcie:      MEM 0x0010000000..0x003efeffff -> 0x0010000000
pci-host-generic 4010000000.pcie:      MEM 0x8000000000..0xffffffffff -> 0x8000000000
pci-host-generic 4010000000.pcie: Memory resource size exceeds max for 32 bits
pci-host-generic 4010000000.pcie: ECAM at [mem 0x4010000000-0x401fffffff] for [bus 00-ff]
pci-host-generic 4010000000.pcie: PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [bus 00-ff]
pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
pci_bus 0000:00: root bus resource [mem 0x10000000-0x3efeffff]
pci_bus 0000:00: root bus resource [mem 0x8000000000-0xffffffffff]
pci 0000:00:00.0: [1b36:0008] type 00 class 0x060000 conventional PCI endpoint
pci_bus 0000:00: resource 4 [io  0x0000-0xffff]
pci_bus 0000:00: resource 5 [mem 0x10000000-0x3efeffff]
pci_bus 0000:00: resource 6 [mem 0x8000000000-0xffffffffff]
virtio_blk virtio0: 1/0/0 default/read/poll queues
virtio_blk virtio0: [vda] 202752 512-byte logical blocks (104 MB/99.0 MiB)
rtc-pl031 9010000.pl031: registered as rtc0
rtc-pl031 9010000.pl031: setting system clock to 2026-01-07T12:04:09 UTC (1767787449)
hw perfevents: enabled with armv8_pmuv3 PMU driver, 7 (0,8000003f) counters available
NET: Registered PF_INET6 protocol family
Segment Routing with IPv6
In-situ OAM (IOAM) with IPv6
sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
NET: Registered PF_PACKET protocol family
NET: Registered PF_KEY protocol family
NET: Registered PF_VSOCK protocol family
registered taskstats version 1
clk: Disabling unused clocks
PM: genpd: Disabling unused power domains
EXT4-fs (vda): orphan cleanup on readonly fs
EXT4-fs (vda): mounted filesystem a9c755bc-f4ff-4ddc-9666-b959fc489394 ro with ordered data mode. Quota mode: disabled.
VFS: Mounted root (ext4 filesystem) readonly on device 254:0.
devtmpfs: mounted
Freeing unused kernel memory: 1152K
Run /sbin/init as init process
  with arguments:
    /sbin/init
  with environment:
    HOME=/
    TERM=linux
EXT4-fs (vda): re-mounted a9c755bc-f4ff-4ddc-9666-b959fc489394 r/w.
# rclone
Usage:
  rclone [flags]
  rclone [command]

Available Commands:
  about       Get quota information from the remote.
  authorize   Remote authorization.
  backend     Run a backend-specific command.
  bisync      Perform bidirectional synchronization between two paths.
  cat         Concatenates any files and sends them to stdout.
  check       Checks the files in the source and destination match.
  checksum    Checks the files in the destination against a SUM file.
  cleanup     Clean up the remote if possible.
  completion  Output completion script for a given shell.
  config      Enter an interactive configuration session.
  copy        Copy files from source to dest, skipping identical files.
  copyto      Copy files from source to dest, skipping identical files.
  copyurl     Copy the contents of the URL supplied content to dest:path.
  cryptcheck  Cryptcheck checks the integrity of an encrypted remote.
  cryptdecode Cryptdecode returns unencrypted file names.
  dedupe      Interactively find duplicate filenames and delete/rename them.
  delete      Remove the files in path.
  deletefile  Remove a single file from remote.
  gendocs     Output markdown docs for rclone to the directory supplied.
  hashsum     Produces a hashsum file for all the objects in the path.
  help        Show help for rclone commands, flags and backends.
  link        Generate public link to file/folder.
  listremotes List all the remotes in the config file and defined in environment variables.
  ls          List the objects in the path with size and path.
  lsd         List all directories/containers/buckets in the path.
  lsf         List directories and objects in remote:path formatted for parsing.
  lsjson      List directories and objects in the path in JSON format.
  lsl         List the objects in path with modification time, size and path.
  md5sum      Produces an md5sum file for all the objects in the path.
  mkdir       Make the path if it doesn't already exist.
  mount       Mount the remote as file system on a mountpoint.
  move        Move files from source to dest.
  moveto      Move file or directory from source to dest.
  ncdu        Explore a remote with a text based user interface.
  nfsmount    Mount the remote as file system on a mountpoint.
  obscure     Obscure password for use in the rclone config file.
  purge       Remove the path and all of its contents.
  rc          Run a command against a running rclone.
  rcat        Copies standard input to file on remote.
  rcd         Run rclone listening to remote control commands only.
  rmdir       Remove the empty directory at path.
  rmdirs      Remove empty directories under the path.
  selfupdate  Update the rclone binary.
  serve       Serve a remote over a protocol.
  settier     Changes storage class/tier of objects in remote.
  sha1sum     Produces an sha1sum file for all the objects in the path.
  size        Prints the total size and number of objects in remote:path.
  sync        Make source and dest identical, modifying destination only.
  test        Run a test command
  touch       Create new file or change file modification time.
  tree        List the contents of the remote in a tree like fashion.
  version     Show the version number.

Use "rclone [command] --help" for more information about a command.
Use "rclone help flags" for to see the global flags.
Use "rclone help backends" for a list of supported services.
'''

