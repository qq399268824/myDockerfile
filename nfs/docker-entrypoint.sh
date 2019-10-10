#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
# or first arg is `something.conf`
#启动nfs
#创建目录
mkdir -p /${FILEPATH:-data} && chown iotmp:iotmp /${FILEPATH:-data}
cat > /etc/exports <<EOF
/${FILEPATH:-data} *(rw,sync,no_subtree_check,fsid=0,no_root_squash)
EOF
/usr/sbin/exportfs -r
/usr/sbin/rpcbind
/usr/sbin/rpc.nfsd
/usr/sbin/rpc.mountd
/usr/sbin/rpc.rquotad

exec "$@"
