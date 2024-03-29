const os = require("os");
//> undefined

os.tmpdir();
//> '/tmp'

os.endianness();
//> 'LE'

os.hostname();
//> 'debian'

/// operating system type, windows could be Windows_NT
os.type();
//> 'Linux'

/// operating system platform, windows could be win32
os.platform();
//> 'linux'

/// cpu architecture
os.arch();
//> 'ia32'

/// operating system release, Windows 7 could be 6.1.7601
os.release();
//> '3.16.0-4-686-pae'

/// seconds your system has started (seconds)
os.uptime();
//> 1123.234601904

/// average load in 1 min, 5 min, and 15 min
os.loadavg();
//> [ 0.2294921875, 0.341796875, 0.255859375 ]

/// return the total memory size (byte)
os.totalmem();
//> 1562935296

/// return free memory size (byte)
os.freemem();
//> 693407744

/// return an array of cpu infomation
os.cpus();
//> [ { model: 'Intel(R) Core(TM)2 Duo CPU     L7500  @ 1.60GHz', ... }
//    { model: 'Intel(R) Core(TM)2 Duo CPU     L7500  @ 1.60GHz', ... } ]

/// show network interface information
os.networkInterfaces();
//> { lo  : [ { address: '127.0.0.1', family: 'IPv4', ... } ],
//    eth0: [ { address: '192.168.5.100', family: 'IPv4', ... } ] }

/// end of line
os.EOL;
//> '\n'
