This is a simple hello world program for testing git on z/OS. It's meant to be used in conjunction with
[Using git for z/OS with GitHub](https://forum.rocketsoftware.com/t/using-git-for-z-os-with-github/654) 
on the [Rocket Community Forum](https://forum.rocketsoftware.com/categories). 

Here's a suggested scenario demonstrating how git can work with MVS datasets:

* Clone this repository. If you want to push changes, fork it instead and then clone the fork.
* cd into the repo and type `make`. This will compile and link the code and test the resulting executable.
* Run `./allocate.sh`. This will create three PDSes (named `DEMO.{H,C,TXT}`) on MVS that will contain members corresponding to the source files in the Unix file system.
* Run `./to_pds.sh` to populate the PDSes. This would be run any time the git repo is refreshed (via `git pull`).
* Log into TSO, edit one of the source files, and save it.
* Back at the Unix command line, run `./from_pds.sh` to copy the files back from MVS to Unix. This will also run a `git status` command, showing the changes.
* When all done, run `./cleanup.sh` to delete the MVS datasets.

Also present are batch job equivalents of the to_/from_pds.sh scripts.

**Update:** The z/OS port of git 2.14.3 now supports the https git protocol in addition to the ssh protocol. To use this, you must set the environment variable `GIT_SSL_CAINFO` to point to a file containing the X.509 certificates of the public Certificate Authorities, in PEM format.

If you do not already have a suitable certificate file, you can download a current copy of the file from a trusted source and verify the signature of the file. A suggested source is the [`curl` web site](https://curl.haxx.se/docs/caextract.html). If you have the Rocket ports of `curl` and `openssl` installed, you can use the following commands. These presume that:

* The path of the directory in which git was installed is in the environment variable `RSUSR`.
* You have write permission to that directory.
* You wish to store the certificate file in that directory.

```
    # Make sure that there is an "etc" subdirectory in the Rocket ported tools directory
    mkdir -p $RSUSR/etc
    cd $RSUSR/etc

    # Get the certificate file
    curl -s -k https://curl.haxx.se/ca/cacert.pem -o cacert.pem

    # Get the signature file and extract just the hash
    curl -s -k https://curl.haxx.se/ca/cacert.pem.sha256 | awk ' {print $1}' > cacert.pem.sha256 

    # Generate the hash on the certificate file and compare it to the signature file.
    # If the signature matches, there will be no output from diff.
    openssl dgst -sha256 cacert.pem | awk ' {print $2}' | diff - cacert.pem.sha256 
```

Once this has been done, you can set GIT_SSL_CAINFO to point to the file:

```
export GIT_SSL_CAINFO=$RSUSR/etc/cacert.pem
```
