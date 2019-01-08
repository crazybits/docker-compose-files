#### 1. get config before run docker-compose

```sh
mkdir -p /data/iserver
curl https://raw.githubusercontent.com/iost-official/go-iost/v2.1.0/config/docker/iserver.yml -o /data/iserver/iserver.yml
curl https://raw.githubusercontent.com/iost-official/go-iost/v2.1.0/config/genesis.yml -o /data/iserver/genesis.yml

```

#### 2. start up node with docker compose
```sh
docker-compose up
```
