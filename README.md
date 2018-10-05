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

## Using Dropbox CLI

You can use CLI for control Dropbox, check status, exclude some folders etc.
Just run next command:

    docker exec -it dropbox cli status

And output will be like this:


    $ docker exec -it dropbox cli status
    Starting...
    $ docker exec -it dropbox cli help
    Dropbox command-line interface
    
    commands:
    
    Note: use dropbox help <command> to view usage for a specific command.
    
     status       get current status of the dropboxd
     throttle     set bandwidth limits for Dropbox
     help         provide help
     stop         stop dropboxd
     running      return whether dropbox is running
     start        start dropboxd
     filestatus   get current sync status of one or more files
     ls           list directory contents with current sync status
     autostart    automatically start dropbox at login
     exclude      ignores/excludes a directory from syncing
     lansync      enables or disables LAN sync
     sharelink    get a shared link for a file in your dropbox
     proxy        set proxy settings for Dropbox

