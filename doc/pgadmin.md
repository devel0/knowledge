# pgadmin

*[database](../README.md#database)*

## description

- its a web interface to a server-side postgres client
- docker pgadmin + binaries for backup ( pg_dump )

## installation

- [run.sh](../_files/pgadmin/run.sh)

notes:
- a /scripts/constants should explain an ip address of the docker container ( I manage docker container using separate /30 container networks with my rules --iptables=false )
- a /security/pgadmin/admin should contain the admin password ( /security must 700 owned by root:root )
- login with specified email ( eg. user@example.com )
- set host address ( eg. my.example.com )
- enable transparent proxy https using nginx with a valid certificate ( eg. letsencrypt )
- tune cpu/memory
- /nas/data must 700 owned by root:root

## post-installation

- enter the container ( eg. docker exec -ti pgadmin /bin/bash )

```sh
chown apache:apache /var/lib/pgadmin/storage
yum install https://download.postgresql.org/pub/repos/yum/10/redhat/rhel-7.3-x86_64/pgdg-redhat10-10-2.noarch.rpm -y 
yum install -y postgresql10
```

- add a server connection ( right click Server / add Server )
- from pgadmin / File / Preferences / Paths / Binary paths ( set PostgresSQL Binary Path : /usr/bin )
- to backup database right click -> Backup and insert a name in Filename ( created files will be in /nas/data/pgadmin/emailname )
