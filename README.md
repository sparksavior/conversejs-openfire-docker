# Converse development environment for Docker

This environment was set up for frontend development purpose on the standard Converse environment. That set up gives you access to a local repository that is a volume mounted by the Docker container on your local machine. You can then use your usual IDE to perform changes and test them against the Converse installation on Docker.

It has been tested against version 9.1.0 of Converse.

## Requirements

* Docker needs to be installed on the machine that will run this environment
* Make sure that Docker have the correct rights on the directory you wish to work on

## Instruction

* Download or clone this package in a local directory
* Edit the device field of the file docker-compose.yml has to be edited to reflect your own environment
* Create the folder related to the device you set up at the previous step 
* Run the shell command `docker-compose up -d` in the directory where the docker-compose.yml file is present
* By default, the team chat will be available at you `localhost:381` address
* Stop the container by executing in your shell `docker stop container-conversejs`

### Build

Normal build:

```bash
docker build \
  --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
  --build-arg APPLICATION_NAME=conversejs \
  --build-arg BUILD_VERSION=v1.0 \
  --file Dockerfile \
  --tag conversejs/converse.js:latest \
  .
```

Multiarch build:

```bash
docker buildx build \
  --platform linux/arm/v7,linux/arm64/v8,linux/amd64 \
  --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
  --build-arg APPLICATION_NAME=conversejs \
  --build-arg BUILD_VERSION=v1.0 \
  --file Dockerfile \
  --tag conversejs/converse.js:latest \
  .
```

## Additional Resources / Information

* website shown at `localhost:381` is based on the original [fullscreen.html](https://raw.githubusercontent.com/conversejs/converse.js/v9.1.0/fullscreen.html) - thanks [@jcbrand](https://github.com/conversejs/converse.js-docker/pull/2#discussion_r859454722)!


Install commands

# docker images                                     
REPOSITORY               TAG       IMAGE ID       CREATED          SIZE
conversejs/converse.js   latest    905eacbcb576   25 seconds ago   596MB

# docker run -p 5280:80 905eacbcb576 

or 

Troublshooting only
# docker run 905eacbcb576 

Access the site
localhost:5280



% openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes


The new error indicates that Prosody is unable to bind the encrypted port for HTTPS (port 5281) due to the absence of a certificate in the SSL/TLS configuration.

To resolve this error, you need to configure SSL/TLS certificates for Prosody to enable HTTPS support. You can either generate self-signed certificates for testing purposes or obtain valid SSL certificates from a trusted Certificate Authority (CA) for production use.

Here's how you can generate self-signed certificates for testing purposes:

Generate SSL/TLS Certificates:

You can use the openssl command-line tool to generate self-signed certificates. Here's an example command to generate a self-signed certificate and private key:

bash
Copy code
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes
This command generates a self-signed certificate (cert.pem) and a private key (key.pem) valid for 365 days. Make sure to replace these paths with the actual paths where you want to store the generated files.

Configure Prosody to Use SSL/TLS:

Once you have the certificate and private key files, you need to configure Prosody to use them. Update your Prosody configuration (prosody.cfg.lua) to include the paths to the certificate and private key files:

lua
Copy code
-- SSL/TLS Configuration
ssl = {
    key = "/path/to/key.pem";
    certificate = "/path/to/cert.pem";
}
Replace /path/to/key.pem and /path/to/cert.pem with the actual paths to your private key and certificate files.

After configuring SSL/TLS certificates, rebuild your Docker image and restart Prosody. This should resolve the error related to the missing SSL/TLS certificate and enable HTTPS support in Prosody.