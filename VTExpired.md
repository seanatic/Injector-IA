BINDER SIDE: Virtual timer expired

```bash
HOOK: [req-000018:rp-cloud-pub-devel/ts_jinsert] BEGIN
HOOK: [req-000018:rp-cloud-pub-devel/ts_jinsert] reply[success: 0]
HOOK: [req-000018:rp-cloud-pub-devel/ts_jinsert] END
HOOK: [req-000019:rp-cloud-pub-devel/ts_jinsert] BEGIN
HOOK: [req-000019:rp-cloud-pub-devel/ts_jinsert] reply[success: 0]
HOOK: [req-000019:rp-cloud-pub-devel/ts_jinsert] END
HOOK: [req-000020:rp-cloud-pub-devel/ts_jinsert] BEGIN
HOOK: [req-000020:rp-cloud-pub-devel/ts_jinsert] reply[success: 0]
HOOK: [req-000020:rp-cloud-pub-devel/ts_jinsert] END
HOOK: [req-000021:rp-cloud-pub-devel/ts_jinsert] BEGIN
HOOK: [req-000021:rp-cloud-pub-devel/ts_jinsert] reply[success: 0]
HOOK: [req-000021:rp-cloud-pub-devel/ts_jinsert] END
ERROR: ALERT! signal 26 received: Virtual timer expired [/usr/src/packages/BUILD/src/libafb/core/afb-sig-monitor.c:385,on_signal_error]
ERROR: BACKTRACE due to signal Virtual timer expired/26:
 [1/12] /lib/x86_64-linux-gnu/libc.so.6(clock+0x25) [0x7fe80ae45335]
 [2/12] lib/afb-helloworld-skeleton.so(+0x17cb) [0x7fe80b0ab7cb]
 [3/12] lib/afb-helloworld-skeleton.so(+0x21b5) [0x7fe80b0ac1b5]
 [4/12] /usr/lib/x86_64-linux-gnu/libafb.so.4(+0x2e215) [0x7fe80b041215]
 [5/12] /usr/lib/x86_64-linux-gnu/libafb.so.4(+0x2d15d) [0x7fe80b04015d]
 [6/12] /usr/lib/x86_64-linux-gnu/libafb.so.4(+0x308c1) [0x7fe80b0438c1]
 [7/12] /usr/lib/x86_64-linux-gnu/libafb.so.4(afb_jobs_run+0x18) [0x7fe80b03dc48]
 [8/12] /usr/lib/x86_64-linux-gnu/libafb.so.4(+0x2ea78) [0x7fe80b041a78]
 [9/12] /usr/lib/x86_64-linux-gnu/libafb.so.4(afb_sched_start+0xdf) [0x7fe80b04242f]
 [10/12] afb-binder(main+0x266) [0x55a9d6ad5576]
 [11/12] /lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0xf3) [0x7fe80ad990b3]
 [12/12] afb-binder(_start+0x2e) [0x55a9d6ad58be]
 [/usr/src/packages/BUILD/src/libafb/core/afb-sig-monitor.c:110,dumpstack]
ERROR: received signal 26 (Virtual timer expired) when processing request [/usr/src/packages/BUILD/src/libafb/core/afb-req-common.c:352,req_common_process_async_cb]
HOOK: [req-000001:helloworld/inject_nominals] reply[error: -1]
DEBUG: received websocket request for rp-cloud-pub-devel/ts_mget: { "class":"Q03101" }
HOOK: [req-000022:rp-cloud-pub-devel/ts_mget] BEGIN
HOOK: [req-000022:rp-cloud-pub-devel/ts_mget] reply[success: 0]
HOOK: [req-000022:rp-cloud-pub-devel/ts_mget] END
DEBUG: received websocket request for rp-cloud-pub-devel/ts_mget: { "class":"I06003" }
HOOK: [req-000023:rp-cloud-pub-devel/ts_mget] BEGIN
HOOK: [req-000023:rp-cloud-pub-devel/ts_mget] reply[success: 0]
HOOK: [req-000023:rp-cloud-pub-devel/ts_mget] END
DEBUG: received websocket request for rp-cloud-pub-devel/ts_mget: { "class":"I06007" }
HOOK: [req-000024:rp-cloud-pub-devel/ts_mget] BEGIN
HOOK: [req-000024:rp-cloud-pub-devel/ts_mget] reply[success: 0]
HOOK: [req-000024:rp-cloud-pub-devel/ts_mget] END
DEBUG: received websocket request for rp-cloud-pub-devel/ts_mget: { "class":"G03023" }
HOOK: [req-000025:rp-cloud-pub-devel/ts_mget] BEGIN
HOOK: [req-000025:rp-cloud-pub-devel/ts_mget] reply[success: 0]
HOOK: [req-000025:rp-cloud-pub-devel/ts_mget] END
```