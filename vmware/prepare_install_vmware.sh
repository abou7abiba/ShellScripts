#!/bin/bash

sudo su -c "apt-get install open-vm-tools open-vm-tools-dev open-vm-dkms open-vm-toolbox open-vm-tools-dev gcc build-essential"

cd /lib/modules/$(uname -r)/build/include/linux
sudo ln -s ../generated/utsrelease.h
sudo ln -s ../generated/autoconf.h
sudo ln -s ../generated/uapi/linux/version.h 

cat << EOF > /tmp/filter.c.patch
--- vmnet-only/filter.c 2013-10-18 15:11:55.000000000 -0400
+++ vmnet-only/filter.c 2013-12-21 20:15:15.000000000 -0500
@@ -27,6 +27,7 @@
 #include "compat_module.h"
 #include <linux/mutex.h>
 #include <linux/netdevice.h>
 +#include <linux/version.h>
 #if COMPAT_LINUX_VERSION_CHECK_LT(3, 2, 0)
 #   include <linux/module.h>
 #else
@@ -203,7 +204,11 @@
 #endif

 static unsigned int
+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 13, 0)
 VNetFilterHookFn(unsigned int hooknum,                 // IN:
+#else
+VNetFilterHookFn(const struct nf_hook_ops *ops,        // IN:
+#endif
 #ifdef VMW_NFHOOK_USES_SKB
                  struct sk_buff *skb,                  // IN:
 #else
@@ -252,7 +257,12 @@

     /* When the host transmits, hooknum is VMW_NF_INET_POST_ROUTING. */
    /* When the host receives, hooknum is VMW_NF_INET_LOCAL_IN. */
 -   transmit = (hooknum == VMW_NF_INET_POST_ROUTING);
 +   
+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 13, 0)
+    transmit = (hooknum == VMW_NF_INET_POST_ROUTING);
+#else
+    transmit = (ops->hooknum == VMW_NF_INET_POST_ROUTING);
+#endif

    packetHeader = compat_skb_network_header(skb);
    ip = (struct iphdr*)packetHeader;
EOF

cd /usr/lib/vmware/modules/source
# untar the vmnet modules
tar -xvf vmnet.tar
#run a the patch you should have just saved earlier
 patch vmnet-only/filter.c < /tmp/filter.c.patch
# re-tar the modules
tar -uvf vmnet.tar vmnet-only
#delete the previous working directory
rm -rf vmnet-only
