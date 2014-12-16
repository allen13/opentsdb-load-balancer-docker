#opentsdb docker container
simple opentsdb-proxy docker image

######Pull from Docker Hub
    docker pull allen13/opentsdb-proxy
######Build Image
    make
######Shell into container
    make shell
######Run Image with etcd host info
    docker run -e ETCD=your-etcd-node:4001 allen13/opentsdb
