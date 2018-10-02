# Dropbox in Docker based on Alpine glibc

[hub]: https://hub.docker.com/r/binlab/dropbox/

Run Dropbox inside Docker. Fully working with local host folder mount or inter-container linking (via `--volumes-from`).

This repository provides the [binlab/dropbox](https://registry.hub.docker.com/u/binlab/dropbox/) image.

## Usage examples

### Quickstart

    docker run -d --restart=always --name=dropbox binlab/dropbox

### Dropbox data mounted to local folder on the host

    docker run -d --restart=always --name=dropbox \
    -v /path/to/folder:/var/lib/dropbox \
    binlab/dropbox

## Linking to Dropbox account after first start

Check the logs of the container to get URL to authenticate with your Dropbox account.
Copy and paste the URL in a browser and login to your Dropbox account to associate.

    docker logs dropbox

You should see something like this:

> "This computer is now linked to Dropbox. Welcome xxxx"
