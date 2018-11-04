# powerdns 
Extended version of psitrax's dns server [powerdns](https://hub.docker.com/r/psitrax/powerdns/). 

Added environment variables: 
* WEBSERVER=yes/no
* WEBSERVER_ADDRESS=127.0.0.1
* WEBSERVER_ALLOW_FROM=127.0.0.1
* WEBSERVER_PASSWORD=changeme
* WEBSERVER_PORT=8081
* API=yes/no
* API_KEY=changeme
* AXFR_IPS=127.0.0.1,=127.0.0.2