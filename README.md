# wsdd-docker

Docker image for wsdd.py. 

wsdd implements a Web Service Discovery host daemon. This enables (Samba) hosts, like your local NAS device or Linux server, to be found by Web Service Discovery Clients like Windows.

## Environment variables

`HOSTNAME`: Samba Netbios name to report. This **must** be specified either through this environment variable or otherwise passed as an argument to the container.

`WORKGROUP`: Workgroup name

`DOMAIN`: Report being a member of an AD DOMAIN. Disables `WORKGROUP` if set.

You can additionally pass wsdd arguments in the environment variable `WSDD_ARGS` or via the docker cli or compose file as regular arguments.

## Running container

### From command line

```
docker run --net=host -e HOSTNAME=$(hostname) logicer16/wsdd
```

It is important that the container is run with the argument --net=host and that the environment variabel HOSTNAME is set to the same value as your Samba netbios name. Samba netbios name defaults to the hostname. 

### From docker compose

A docker-compose.yml file could look like the one below. 
```
        wsdd:
                image: "logicer16/wsdd"
                environment:
                        - HOSTNAME=NETBIOS_NAME
                restart: unless-stopped
                network_mode: "host"
```
