#opentsdb cluster load balancer
Load balancer for an opentsdb cluster based on haproxy, confd and etcd. Haproxy balanced servers are controlled by adding and removing keys to etcd. Haproxy config file is changed and reload on each etcd key change.

######Add server to load balancer 
    etcdctl set /opentsdb/servers/node-01 8.8.8.8:4242
######Remove server from load balancer
    etcdctl rm /opentsdb/servers/node-01
######Pull from Docker Hub
    docker pull allen13/opentsdb-load-balancer
######Build Image
    make
######Shell into container
    make shell
######Run Image with etcd host info
    docker run -e ETCD=your-etcd-node:4001 allen13/opentsdb-load-balancer
